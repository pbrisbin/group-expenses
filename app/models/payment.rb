class Payment < ActiveRecord::Base
  extend ActsAsMoney

  belongs_to :group

  belongs_to :payer, :class_name => "User"
  belongs_to :payee, :class_name => "User"

  acts_as_money :amount

  scope :for_group, ->(group) { where("group_id = ?", group.id) }
  scope :to_user,   ->(user)  { where("payee_id =?", user.id) }

  attr_accessible :payer, :payee, :group, :amount
end
