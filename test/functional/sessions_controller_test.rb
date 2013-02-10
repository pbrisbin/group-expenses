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
    post :create,
      :email    => 'jim@gmail.com',
      :password => 'secret'

    assert_not_nil @controller.user_session.user

    assert_redirected_to :root
    assert_match(/you have been logged in/i, flash[:notice])
  end

  def test_create_with_invalid_user
    post :create,
      :email    => 'foo@bar.com',
      :password => 'secret'

    assert_nil @controller.user_session.user

    assert_redirected_to :action => :new
    assert_match(/user not found/i, flash[:error])
  end

  def test_create_with_invalid_password
    post :create,
      :email    => 'jim@gmail.com',
      :password => 'invalid'

    assert_nil @controller.user_session.user

    assert_redirected_to :action => :new
    assert_match(/invalid password/i, flash[:error])
  end

end
