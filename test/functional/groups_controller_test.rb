require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  include ControllerStubs
  include Factories

  def test_index
    user   = stub_current_user
    groups = 3.times.map { Group.new }

    user.expects(:groups).returns(groups)

    get :index

    assert_response :success
    assert_equal groups, assigns(:groups)
  end

  def test_create
    stub_current_user(
      user = create_user
    )

    post :create, :name => "Group name"

    assert_redirected_to :action => :index
    assert_match(/success/i, flash[:notice])

    group = Group.last

    assert_equal "Group name", group.name
    assert_equal [user], group.users
  end

end
