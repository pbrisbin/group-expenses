class SessionsController < ApplicationController

  def show
  end

  def new
  end

  def create
    login = Login.new(params)
    login.execute(user_session)

    flash[:notice] = "You have been logged in"
    redirect_to :root
  end

  def destroy
    user_session.destroy

    flash[:notice] = "You have been logged out"
    redirect_to :root
  end

end
