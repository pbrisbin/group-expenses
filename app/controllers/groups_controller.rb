class GroupsController < ApplicationController

  before_filter :require_current_user

  def index
    @groups = current_user.groups
  end

end
