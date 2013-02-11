class UserSession
  KEY     = :user_session
  TIMEOUT = 2.hours

  def initialize(store = {})
    @store = store
  end

  def user
    id = store[:user_id]
    id && User.find_by_id(id)
  end

  def save(user)
    store[:user_id] = user.id
    store[:expires] = Time.now + TIMEOUT
  end

  def destroy
    @store[KEY] = nil
  end

  private

  def store
    @store[KEY] ||= {}
  end

end
