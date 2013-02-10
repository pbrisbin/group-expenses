require 'spec_helper'
require_model_for(__FILE__)

describe Login do
  subject do
    Login.new('email', 'password')
  end

  context "execution" do
    before do
      @user = double("User", :email => 'email').as_null_object
      User.stub(:find).and_return(@user)
    end

    it "should find the user by email" do
      User.should_receive(:find).with('email').and_return(@user)

      subject.execute
    end

    it "should validate the password" do
      @user.should_receive(:valid_password?).with('password')

      subject.execute
    end

    context "when successful" do
      before do
        @user.stub(:valid_password?).and_return(true)
      end

      it "should return the user" do
        subject.execute.should == @user
      end

      it "should report success" do
        subject.execute
        subject.successful?.should be_true
      end

      it "should have no error message" do
        subject.execute
        subject.error_message.should be_nil
      end

      it "should save in the session if given" do
        session = mock
        session.should_receive(:save).with(@user)

        subject.execute(session)
      end

    end

    context "when user not found" do
      it "should be unsuccessful with an error message" do
        User.stub(:find).and_return(nil)

        subject.execute.should be_false
        subject.successful?.should be_false
        subject.error_message.should == "User not found"
      end
    end

    context "when password is invalid" do
      it "should be unsuccessful with an error message" do
        @user.stub(:valid_password?).and_return(false)

        subject.execute.should be_false
        subject.successful?.should be_false
        subject.error_message.should == "Invalid password"
      end
    end
  end

end
