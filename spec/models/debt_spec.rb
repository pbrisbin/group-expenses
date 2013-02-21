require 'spec_helper'

describe Debt do
  let(:ower)  { double("Ower") }
  let(:owee)  { double("Owee") }
  let(:group) { double("Group", :users => [ower, owee]) }

  subject { Debt.new(ower, owee, group) }

  before do
    [ower, owee].each do |user|
      user.stub_chain(:expenses, :for_group).and_return([])
      user.stub_chain(:payments, :for_group, :to_user).and_return([])
    end
  end

  context "when nothing's exchanged hands" do
    it "should return no debt" do
      subject.amount.should == 0.to_money

      subject.something?.should be_false
      subject.nothing?.should be_true

      subject.owed_to?(ower).should be_false
      subject.owed_by?(ower).should be_false

      subject.owed_to?(owee).should be_false
      subject.owed_by?(owee).should be_false
    end
  end

end
