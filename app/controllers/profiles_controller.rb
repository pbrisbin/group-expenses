class ProfilesController < ApplicationController
  def new
  end

  def create
    user = User.new
    user.credentials = Credentials.new(params)
    user.save!

    flash[:notice] = "Profile successfully created"
    redirect_to :root

  rescue ActiveRecord::RecordNotUnique
    flash[:error] = "A user by that email already exists"
    redirect_to :action => :new
  end
end
