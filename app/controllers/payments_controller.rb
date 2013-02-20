class PaymentsController < ApplicationController

  before_filter :require_current_user

  def new
    group = Group.find(params[:group_id])
    users = group.users.where("user_id != ?", current_user.id)

    @group_id = group.id
    @emails   = users.collect { |u| [u.email, u.email] }
  end

  def create
    payee = User.find_by_email(params[:payee])

    raise "Payee not found" if payee.nil?

    options = {
      :group  => Group.find(params[:group_id]),
      :payer  => current_user,
      :payee  => payee,
      :amount => params[:amount]
    }

    Payment.create!(options)

    flash[:notice] = "Payment created"
    redirect_to :root
  end

end
