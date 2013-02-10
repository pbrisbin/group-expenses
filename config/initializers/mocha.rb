if Rails.env.test?
  require "mocha/version"
  require "mocha/deprecation"

  Mocha::Deprecation.mode = :disabled
end
