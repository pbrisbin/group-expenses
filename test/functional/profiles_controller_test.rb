require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase

  def test_create
    post :create,
      :email    => 'jim@gmail.com',
      :password => 'secret',
      :confirm  => 'secret'

    assert_redirected_to :root
    assert_match(/success/i, flash[:notice])

    assert_not_nil User.find_by_email('jim@gmail.com')
  end

  def test_create_existing_user
    create_user('jim@gmail.com')

    assert_no_difference 'User.count' do
      post :create,
        :email    => 'jim@gmail.com',
        :password => 'secret',
        :confirm  => 'secret'
    end

    assert_redirected_to :action => :new
    assert_not_nil flash[:error]
  end

  def test_create_empty_email

  end

  def test_create_empty_password

  end

  def test_create_password_mismatch

  end

  private

  def create_user(email, password = 'secret')
    user = User.new
    user.email = email
    user.salt  = ''
    user.password = password
    user.save!
  end

end
