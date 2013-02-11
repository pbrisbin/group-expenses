require 'spec_helper'

describe Login do
  let(:options) { {:email => "email"} }

  let(:session) { double("User session", :save => true) }

  subject { Login.new(options) }

  context "#execute" do
    it "should raise when the user cannot be found" do
      User.stub(:find_by_email).and_return(nil)

      expect { subject.execute(session) }.to raise_error(UserError, /unable to find/i)
    end

    context "With a user present" do
      let(:user) do
        double("User", :credentials => double("Credentials", :== => true))
      end

      before do
        User.stub(:find_by_email).and_return(user)
      end

      it "should find that user" do
        User.should_receive(:find_by_email).with("email").and_return(user)

        subject.execute(session)
      end

      it "should build and check credentials from the parameters" do
        creds = double("Incoming creds")

        Credentials.should_receive(:new).with(options).and_return(creds)

        user.credentials.should_receive(:==).with(creds).and_return(true)

        subject.execute(session)
      end

      it "should raise when the credentials don't match" do
        user.credentials.stub(:==).and_return(false)

        expect { subject.execute(session) }.to raise_error(UserError, /invalid credentials/i)
      end

      it "should store in session when the credentials do match" do
        user.credentials.stub(:==).and_return(true)

        session.should_receive(:save).with(user)

        subject.execute(session)
      end
    end
  end

end
