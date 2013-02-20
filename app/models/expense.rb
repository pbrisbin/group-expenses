class Expense < ActiveRecord::Base
  extend ActsAsMoney

  belongs_to :user
  belongs_to :group

  acts_as_money :amount

  scope :for_user,  ->(user)  { where("user_id = ?",  user.id)  }
  scope :for_group, ->(group) { where("group_id = ?", group.id) }

  attr_accessible :user, :group, :amount, :comment

end
