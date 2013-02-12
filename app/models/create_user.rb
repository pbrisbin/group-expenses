class CreateUser

  def initialize(options)
    @options = options
  end

  def execute(session)
    user = User.new
    user.credentials = Credentials.new(@options)
    user.save!

    session.save(user)

  rescue ActiveRecord::RecordNotUnique
    raise UserError, "A user by that email already exists"
  end

end
