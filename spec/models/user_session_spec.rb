require 'spec_helper'

describe UserSession do

  let(:store) { {} }
  let(:user)  { double("User", :id => 42) }

  it "should store and find the user by id" do
    user_session = UserSession.new(store)
    user_session.save(user)

    User.should_receive(:find_by_id).with(42).and_return(user)

    user_session.user.should == user
  end

  it "should be destroyable" do
    user_session = UserSession.new(store)
    user_session.save(user)

    user_session.destroy
    user_session.user.should be_nil
  end

end

