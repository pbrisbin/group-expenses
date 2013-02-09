require 'set'
require 'method_options'

class User
  include MethodOptions

  attr_reader :email

  def self.create(options)
    email    = required(options, :email)
    password = required(options, :password)

    instance = new(email, password)

    if options.fetch(:persist, true)
      store(instance)
    end

    instance
  end

  def self.find(email)
    @users && @users.detect { |u| u.email == email }
  end

  def self.store(instance)
    @users ||= Set.new
    @users << instance
  end

  def initialize(email, password)
    @email = email
    @password = password
  end

  def valid_password?(password)
    password == @password
  end

  protected

  def ==(other)
    email == other.email
  end

end
