class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :setup_user_session

  attr_accessor :user_session, :current_user

  private

  def setup_user_session
    @user_session = UserSession.new(session)
    @current_user = @user_session.user
  end

end
