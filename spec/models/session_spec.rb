require 'spec_helper'
require_model_for(__FILE__)

describe Session do
  before do
    Session.clear!
  end

  let(:user) { double("User", :email => 'email') }

  it "should hold authenticated sessions mapped to emails" do
    Session.store(42, user)

    Session.authenticated?(42).should be_true
    Session.get(42).should == 'email'
  end
end
