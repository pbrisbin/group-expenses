class ProfilesController < ApplicationController
  def new
  end

  def create
    create_user = CreateUser.new(params)
    create_user.execute(user_session)

    flash[:notice] = "Profile successfully created"
    redirect_to :root
  end
end
