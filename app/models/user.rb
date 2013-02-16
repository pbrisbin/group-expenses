class User < ActiveRecord::Base

  has_and_belongs_to_many :groups

  def credentials
    Credentials.new(
      :email => self.email,
      :salt  => self.salt,
      :password_hash => self.password
    )
  end

  def credentials=(credentials)
    self.email    = credentials.email
    self.password = credentials.password_hash
    self.salt     = credentials.salt
  end
end
