class SessionsController < ApplicationController
  def new
  end

  def create
    rescuing_back do
      user = User.find_by_email(params[:email])

      raise "User not found"   if user.nil?
      raise "Invalid password" if params[:password] != user.password

      session[:user_id] = user.id

      flash[:notice] = "Logged in"
      redirect_to :root
    end
  end

  def destroy
    session.delete(:user_id)

    flash[:notice] = "Logged out"
    redirect_to :root
  end

end
