require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include MockParams
  include StubSession

  def setup
    @user_session = stub_new_sessions
  end

  def test_create
    options = mock_params

    create_user = mock
    create_user.expects(:execute).with(@user_session)

    CreateUser.expects(:new).with(has_entries(options)).returns(create_user)

    post :create, options

    assert_redirected_to :root
    assert_match(/success/i, flash[:notice])
  end

end
