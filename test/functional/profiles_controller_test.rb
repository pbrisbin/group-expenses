require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include MockParams
  include ControllerStubs

  def test_create
    options = mock_params

    user_session = stub_user_session

    create_user = mock
    create_user.expects(:execute).with(user_session)

    CreateUser.expects(:new).with(has_entries(options)).returns(create_user)

    post :create, options

    assert_redirected_to :root
    assert_match(/success/i, flash[:notice])
  end

end
