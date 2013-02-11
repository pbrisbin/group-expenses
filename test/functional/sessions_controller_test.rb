require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    user = User.new
    user.email = 'jim@gmail.com'
    user.salt  = ''
    user.password = 'secret'
    user.save!

    @controller.user_session = UserSession.new
  end

  def test_create
    login('jim@gmail.com', 'secret')

    assert_not_nil @controller.user_session.user

    assert_redirected_to :root
    assert_match(/you have been logged in/i, flash[:notice])
  end

  def test_create_with_invalid_user
    login('foo@bar.com', 'secret')

    assert_nil @controller.user_session.user

    assert_response :redirect
    assert_match(/unable to find/i, flash[:error])
  end

  def test_create_with_invalid_password
    login('jim@gmail.com', 'invalid')

    assert_nil @controller.user_session.user

    assert_response :redirect
    assert_match(/invalid/i, flash[:error])
  end

  def test_show
    get :show
    assert_match(/not logged in/i, @response.body)

    login('jim@gmail.com', 'secret')

    get :show
    assert_match(/logged in as jim@gmail\.com/i, @response.body)
  end

  private

  def login(email, password)
    post :create, :email => email, :password => password
  end

end
