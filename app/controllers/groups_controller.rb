class GroupsController < ApplicationController

  before_filter :require_current_user

  def new
  end

  def create
    options = {
      :name  => params[:name],
      :users => [current_user]
    }

    Group.create!(options)

    flash[:notice] = "Group successfully created"
    redirect_to :root
  end

end
