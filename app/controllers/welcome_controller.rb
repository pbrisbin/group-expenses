class WelcomeController < ApplicationController
  def index
    @groups = current_user && current_user.groups
  end
end
