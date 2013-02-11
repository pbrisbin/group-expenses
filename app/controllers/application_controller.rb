class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :setup_user_session

  rescue_from(UserError) do |ex|
    logger.error("[UserError]: #{ex}")

    flash[:error] = "#{ex}"
    redirect_back
  end

  attr_accessor :user_session, :current_user

  private

  def setup_user_session
    @user_session = UserSession.new(session)
    @current_user = @user_session.user
  end

  def redirect_back(default = :root)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to default
  end
end
