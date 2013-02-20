class User < ActiveRecord::Base

  has_many :memberships
  has_many :groups, :through => :memberships

  has_many :expenses
  has_many :payments, :foreign_key => "payer_id"

  validates_presence_of :email
  validates_presence_of :password

  validates_uniqueness_of :email

  validate :valid_confirmation

  attr_accessible :email, :password, :confirm

  private

  def valid_confirmation
    if self.password != self.confirm
      errors.add(:confirm, "does not match password")
    end
  end

end
