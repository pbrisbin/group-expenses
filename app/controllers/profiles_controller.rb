class ProfilesController < ApplicationController

  def new
  end

  def create
    rescuing_back do
      user = User.create!(params.slice(:email, :password, :confirm))

      session[:user_id] = user.id

      flash[:notice] = "Profile created"
      redirect_to :root
    end
  end

end
