ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/setup'

class ActiveSupport::TestCase
  # bug?
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionController::TestCase::Behavior

  def setup
    @routes = Rails.application.routes
  end

  fixtures :all
end
