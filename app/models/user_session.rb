class UserSession
  KEY     = :user_session
  TIMEOUT = 2.hours

  def initialize(store = {})
    @store = store
  end

  def user
    email = store[:email]
    email && User.find(email)
  end

  def save(user)
    store[:email]   = user.email
    store[:expires] = Time.now + TIMEOUT
  end

  def store
    @store[KEY] ||= {}
  end
end
