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

module StubSession

  private

  def stub_new_sessions(session = UserSession.new)
    UserSession.stubs(:new).returns(session)

    session
  end
end
