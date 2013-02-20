class ProfilesController < ApplicationController

  def new
  end

  def create
    user = User.create!(params.slice(:email, :password, :confirm))

    session[:user_id] = user.id

    flash[:notice] = "Profile created"
    redirect_to :root
  end

end
