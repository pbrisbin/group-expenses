require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @user_session = UserSession.new
    UserSession.stubs(:new).returns(@user_session)
  end

  def test_create
    options = mock_params

    login = mock
    login.expects(:execute).with(@user_session)

    Login.expects(:new).with(has_entries(options)).returns(login)

    post :create, options

    assert_redirected_to :root
    assert_match(/you have been logged in/i, flash[:notice])
  end

  def test_show
    @user_session.stubs(:user).returns(nil)

    get :show
    assert_match(/not logged in/i, @response.body)

    @user_session.stubs(:user).returns(
      stub(:email => 'jim@gmail.com')
    )

    get :show
    assert_match(/logged in as jim@gmail\.com/i, @response.body)
  end

  def test_destroy
    @user_session.expects(:destroy)

    delete :destroy

    assert_redirected_to :root
    assert_match(/you have been logged out/i, flash[:notice])
  end

  private

  def mock_params
    HashWithIndifferentAccess.new({
      :foo => 'foo', :bar => 'bar'
    })
  end

end
