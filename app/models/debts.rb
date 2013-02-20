class Debts
  Debt = Struct.new(:ower, :owee, :amount)

  def initialize(group)
    @group = group
  end

  def owed_to(user)
    debts.select { |d| d.owee == user.email }
  end

  def owed_by(user)
    debts.select { |d| d.ower == user.email }
  end

  private

  attr_reader :group

  def debts
    @debts ||= calculate_debts
  end

  def calculate_debts
    users = group.users
    pairs = users.to_a.permutation(2)

    pairs.map do |user, other_user|
      amount  = expenses_paid(other_user) - expenses_paid(user)
      amount /= users.size

      if amount > 0.to_money
        Debt.new(user.email, other_user.email, amount)
      end
    end.compact
  end

  def expenses_paid(user)
    user.expenses.for_group(group).sum(&:amount).to_money
  end

end
