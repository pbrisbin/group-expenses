class Login

  def initialize(options)
    @options = options
  end

  def execute(session)
    user = User.find_by_email(@options[:email]) or
      raise UserError, "Unable to find a user by that email"

    credentials = Credentials.new(@options)

    user.credentials == credentials or
      raise UserError, "Invalid credentials"

    session.save(user)
  end

end
