class Debt
  attr_reader :ower, :owee

  def initialize(ower, owee, group)
    @ower  = ower
    @owee  = owee
    @group = group
  end

  def amount
    @amount ||= calculate_amount
  end

  def owed_to?(user)
    something? && owee == user
  end

  def owed_by?(user)
    something? && ower == user
  end

  def something?
    amount > 0.to_money
  end

  def nothing?
    !something?
  end

  private

  attr_reader :group

  def calculate_amount
    amt  = expenses_paid(owee)
    amt -= expenses_paid(ower)
    amt /= group.users.size

    amt
  end

  def expenses_paid(user)
    user.expenses.for_group(group).sum(&:amount).to_money
  end

end
