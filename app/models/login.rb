require 'user'
require 'session'

class Login

  def initialize(email, password)
    @email = email
    @password = password
    @successful = false
  end

  def execute(session_id = nil)
    user = User.find(@email)

    if user && user.valid_password?(@password)
      Session.store(session_id, user) if session_id
      @successful = true
    else
      set_error_message(!!user)
    end

    @successful && user
  end

  def successful?
    @successful
  end

  def error_message
    @error_message
  end

  private

  def set_error_message(user_found)
    if user_found
      @error_message = "Invalid password"
    else
      @error_message = "User not found"
    end
  end

end
