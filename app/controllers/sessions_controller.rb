class SessionsController < ApplicationController

  def new
  end

  def create
    login = Login.new(params[:email], params[:password])
    login.execute(user_session)

    if login.successful?
      flash[:notice] = "You have been logged in"
      redirect_to :root
    else
      flash[:error] = login.error_message
      redirect_to :action => :new
    end
  end

  def destroy
  end

  def show
  end

end
