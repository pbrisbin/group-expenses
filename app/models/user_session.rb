class UserSession
  def initialize(store = {})
    @store = store
  end

  def user
    id = store[:user_id]
    id && User.find_by_id(id)
  end

  def save(user)
    store[:user_id] = user.id
  end

  def destroy
    store.delete(:user_id)
  end

  private

  attr_reader :store

end
