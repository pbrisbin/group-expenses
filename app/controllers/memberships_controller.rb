class MembershipsController < ApplicationController

  before_filter :require_current_user

  def new
    @token = params[:token]
  end

  def create
    group = Group.find_by_join_token(params[:token])

    raise "Group not found" if group.nil?

    group.users << current_user
    group.save!

    flash[:notice] = "Group joined"
    redirect_to :root
  end
end
