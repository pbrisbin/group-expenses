require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  include ControllerStubs

  def test_index
    get :index
    assert_response :success
  end

  def test_index_logged_in
    stub_current_user

    get :index
    assert_response :success
  end
end
