class GroupsController < ApplicationController

  before_filter :require_current_user

  def index
    @groups = current_user.groups
  end

  def new
  end

  def create
    group = Group.new
    group.name  = params[:name]
    group.users = [current_user]
    group.save!

    flash[:notice] = "Group successfully created"
    redirect_to :action => :index
  end

end
