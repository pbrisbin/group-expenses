require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_index_logged_in
    @controller.current_user = User.new('', '')

    get :index
    assert_response :success
  end
end
