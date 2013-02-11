class Credentials
  include MethodOptions

  attr_reader :email

  def initialize(options)
    @email    = required(options, :email)
    @password = options[:password]
    @salt     = options[:salt]
    @password_hash = options[:password_hash]

    unless confirmed?(options)
      raise UserError, "Password must match Confirmation"
    end
  end

  def salt
    @salt ||= generate_salt
  end

  def password_hash
    @password_hash ||= generate_password
  end

  def ==(other)
    email == other.email &&
      password_hash == other.password_hash
  end

  private

  def generate_password
    @password # TODO
  end

  def generate_salt
    '' # TODO
  end

  def confirmed?(options)
    return true unless options.has_key?(:password)
    return true unless options.has_key?(:confirm)

    options[:password] == options[:confirm]
  end

end
