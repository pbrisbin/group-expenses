require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include MockParams
  include ControllerStubs

  def test_create
    options = mock_params

    user_session = stub_user_session

    login = mock
    login.expects(:execute).with(user_session)

    Login.expects(:new).with(has_entries(options)).returns(login)

    post :create, options

    assert_redirected_to :root
    assert_match(/you have been logged in/i, flash[:notice])
  end

  def test_show
    get :show
    assert_match(/not logged in/i, @response.body)
  end

  def test_show_logged_in
    user = stub_current_user

    get :show
    assert_match(/logged in as #{user.email}/i, @response.body)
  end

  def test_destroy
    user_session = stub_user_session
    user_session.expects(:destroy)

    delete :destroy

    assert_redirected_to :root
    assert_match(/you have been logged out/i, flash[:notice])
  end

end
