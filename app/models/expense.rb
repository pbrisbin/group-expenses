class Expense < ActiveRecord::Base
  extend ActsAsMoney

  belongs_to :user
  belongs_to :group

  acts_as_money :amount

  attr_accessible :user, :group, :amount, :comment

end
