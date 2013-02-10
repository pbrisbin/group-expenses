require 'spec_helper'
require_model_for(__FILE__)

describe UserSession do

  let(:store) { {} }
  let(:user)  { double("User", :email => 'email') }

  it "should save the user by email" do
    user_session = UserSession.new(store)
    user_session.save(user)

    store[UserSession::KEY][:email].should == 'email'
  end

  it "should find the user by email" do
    User.should_receive(:find).with('email').and_return(user)

    user_session = UserSession.new(store)
    user_session.save(user)

    user_session.user.should == user
  end

end

