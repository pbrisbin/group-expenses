require 'test_helper'

class SessionsControllerTest < ActiveSupport::TestCase

  def setup
    super

    User.create(
      :email    => 'jim@gmail.com',
      :password => 'secret'
    )

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

    assert_redirected_to :action => :new
    assert_match(/user not found/i, flash[:error])
  end

  def test_create_with_invalid_password
    login('jim@gmail.com', 'invalid')

    assert_nil @controller.user_session.user

    assert_redirected_to :action => :new
    assert_match(/invalid password/i, flash[:error])
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
