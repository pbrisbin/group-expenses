require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_credentials
    user = User.new
    user.stubs(:email => 'an email')
    user.stubs(:salt  => 'a salt')
    user.stubs(:password => 'some hash')

    credentials = stub

    Credentials.expects(:new).with(
      :email => 'an email',
      :salt  => 'a salt',
      :password_hash => 'some hash'
    ).returns(credentials)

    assert_equal credentials, user.credentials,
      "User#credentials should build and return credentials"
  end

  def test_credentials=
    credentials = stub(
      :email => 'an email',
      :salt  => 'a salt',
      :password_hash => 'some hash'
    )

    user = User.new
    user.credentials = credentials

    assert_equal 'an email', user.email,
      "User#credentials= should assign the email"

    assert_equal 'a salt', user.salt,
      "User#credentials= should assign the salt"

    assert_equal 'some hash', user.password,
      "User#credentials= should assign the hash"
  end

end
