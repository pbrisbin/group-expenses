class ExpensesController < ApplicationController
  before_filter :require_current_user

  def new
    @group_id = params[:group_id]
  end

  def create
    rescuing_back do
      options = {
        :user    => current_user,
        :group   => Group.find(params[:group_id]),
        :amount  => params[:amount],
        :comment => params[:comment]
      }

      Expense.create!(options)

      flash[:notice] = "Expense added"
      redirect_to :root
    end
  end

end
