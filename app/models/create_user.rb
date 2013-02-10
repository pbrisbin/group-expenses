class CreateUser
  include PubSub

  def initialize(options)
    @options = options
  end

  def create!
    if exists?
      publish(:failure, "A user by that email already exists")
      return
    end

    if mismatch?
      publish(:failure, "Password and Confirmation do not match")
      return
    end

    User.create(@options)

    publish(:success)

  rescue => ex
    publish(:failure, "#{ex}")
  end

  private

  def exists?
    !!User.find(@options[:email])
  end

  def mismatch?
    @options[:password] != @options[:password_confirmation]
  end
end
