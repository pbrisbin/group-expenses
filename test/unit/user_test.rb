require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include Factories

  def test_credentials
    user = new_user

    credentials = stub

    Credentials.expects(:new).with(
      :email => user.email,
      :salt  => user.salt,
      :password_hash => user.password,
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

  def test_groups
    user = new_user

    assert_equal [], user.groups

    user.groups << Group.new
    user.groups << Group.new
    user.save!

    assert_equal 2, user.groups.count
  end

end
