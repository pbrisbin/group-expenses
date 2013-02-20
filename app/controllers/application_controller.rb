class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from(StandardError) do |ex|
    logger.error("#{ex}: #{ex.backtrace.join("\t\n")}")

    flash[:error] = "#{ex.message}"
    redirect_back
  end

  def current_user
    @current_user ||= find_current_user
  end

  helper_method :current_user

  private

  def find_current_user
    id = session[:user_id]
    id && User.find_by_id(id)
  end

  def require_current_user
    if current_user.nil?
      flash[:error] = "You must be logged in to access this page"
      redirect_back
    end
  end

  def redirect_back(default = :root)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to default
  end

end
