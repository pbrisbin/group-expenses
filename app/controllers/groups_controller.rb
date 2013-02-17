class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    options = {
      :name  => params[:name],
      :users => [current_user]
    }

    group = Group.create!(options)

    flash[:notice] = "Group successfully created"
    redirect_to group

  rescue => ex
    logger.error "#{ex}: #{ex.backtrace.join("\t\n")}"

    flash[:error] = "#{ex}"
    redirect_to :action => :new
  end

end
