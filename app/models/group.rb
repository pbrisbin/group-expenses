class Group < ActiveRecord::Base

  has_many :memberships
  has_many :users, :through => :memberships

  before_create :assign_join_token

  attr_accessible :name, :users

  private

  def assign_join_token
    self.join_token = Digest::SHA1.hexdigest(
      Array.new(6) { rand(256).chr }.join
    )
  end

end
