class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= find_current_user
  end

  helper_method :current_user

  private

  def find_current_user
    id = session[:user_id]
    id && User.find_by_id(id)
  end

end
