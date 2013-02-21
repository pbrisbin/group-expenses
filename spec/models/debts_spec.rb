require 'spec_helper'

describe Debts do
  let(:users) do
    [
      double("User A"),
      double("User B"),
      double("User C")
    ]
  end

  let(:group) do
    double("Group", :users => users)
  end

  subject { Debts.new(users.first, group) }

  before do
    Debt.stub(:new).and_return(
      double(:owed_to? => false, :owed_by? => false)
    )
  end

  it "should calculate debts for each pair in a group" do
    Debt.should_receive(:new).with(users[0], users[1], group)
    Debt.should_receive(:new).with(users[0], users[2], group)
    Debt.should_receive(:new).with(users[1], users[0], group)
    Debt.should_receive(:new).with(users[1], users[2], group)
    Debt.should_receive(:new).with(users[2], users[0], group)
    Debt.should_receive(:new).with(users[2], users[1], group)

    subject.owed_to.should == []
    subject.owed_by.should == []
  end

  it "should check for and return any debts owed" do
    debt_owed_to = double(:owed_by? => false)
    debt_owed_to.should_receive(:owed_to?).with(users[0]).and_return(true)

    debt_owed_by = double(:owed_to? => false)
    debt_owed_by.should_receive(:owed_by?).with(users[0]).and_return(true)

    Debt.stub(:new).with(users[0], users[1], group).and_return(debt_owed_to)
    Debt.stub(:new).with(users[0], users[2], group).and_return(debt_owed_by)

    subject.owed_to.should == [debt_owed_to]
    subject.owed_by.should == [debt_owed_by]
  end

end
