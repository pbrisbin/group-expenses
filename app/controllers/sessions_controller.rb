class SessionsController < ApplicationController

  def show
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email]) or
      raise UserError, "Unable to find a user by that email"

    credentials = Credentials.new(params)

    user.credentials == credentials or
      raise UserError, "Invalid credentials"

    user_session.save(user)

    flash[:notice] = "You have been logged in"
    redirect_to :root
  end

  def destroy
    user_session.destroy
  end

end
