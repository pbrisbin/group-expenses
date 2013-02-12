ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/setup'

#
# Test helper modules below, include them into tests that need them, if
# they get too big move them into other files.
#

module MockParams

  private

  def mock_params
    HashWithIndifferentAccess.new({
      :foo => 'foo', :bar => 'bar'
    })
  end
end

module ControllerStubs

  private

  def stub_user_session(session = user_session_stub)
    @controller.stubs(:user_session).returns(session)

    session
  end

  def stub_current_user(user = user_stub)
    @controller.stubs(:current_user).returns(user)

    user
  end

  def user_stub
    stub(
      "User",
      :email    => 'email',
      :password => 'password'
    )
  end

  def user_session_stub
    stub(
      "Session",
      :user    => nil,
      :save    => true,
      :destroy => true
    )
  end
end
