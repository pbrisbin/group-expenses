class DashboardController < ApplicationController
  def show
    if current_user
      @groups = current_user.groups
    else
      @groups = []
    end
  end
end
