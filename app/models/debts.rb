class Debts
  def initialize(user, group)
    @user  = user
    @group = group
  end

  def owed_to
    debts.select { |d| d.owed_to?(user) }
  end

  def owed_by
    debts.select { |d| d.owed_by?(user) }
  end

  private

  attr_reader :group, :user

  def debts
    @debts ||= calculate_debts
  end

  def calculate_debts
    pairs = group.users.to_a.permutation(2)

    pairs.map do |ower, owee|
      Debt.new(ower, owee, group)
    end
  end

end
