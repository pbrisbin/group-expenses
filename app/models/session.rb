require 'set'
require 'user'

class Session
  def self.authenticated?(id)
    sessions.has_key?(id)
  end

  def self.clear!
    @sessions = nil
  end

  def self.sessions
    @sessions ||= {}
  end

  def self.store(id, user)
    sessions[id] = user.email
  end

  def self.get(id)
    sessions[id]
  end

end
