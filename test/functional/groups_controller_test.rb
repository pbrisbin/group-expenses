require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  include ControllerStubs

  def test_index
    user   = stub_current_user
    groups = 3.times.map { Group.new }

    user.expects(:groups).returns(groups)

    get :index

    assert_response :success
    assert_equal groups, assigns(:groups)
  end

end
