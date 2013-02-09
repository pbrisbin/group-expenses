require 'test_helper'

class WelcomeControllerTest < ActiveSupport::TestCase
  def test_index
    get :index
    assert_response :success
  end
end
