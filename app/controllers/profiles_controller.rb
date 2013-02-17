class ProfilesController < ApplicationController

  def new
  end

  def create
    user = User.create!(params.slice(:email, :password, :confirm))

    session[:user_id] = user.id

    flash[:notice] = "Profile created"
    redirect_to :root
  rescue => ex
    logger.error "#{ex}: #{ex.backtrace.join("\t\n")}"

    flash[:error] = "#{ex}"
    redirect_to :action => :new
  end

end
