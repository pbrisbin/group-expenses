require 'spec_helper'

module ActiveRecord
  class RecordNotUnique < StandardError
  end
end

describe CreateUser do
  let(:options) { {} }
  let(:session) { double("Session", :save => true) }

  subject { CreateUser.new(options) }

  it "creates a user with credentials from options" do
    creds = double("Credentials")

    Credentials.should_receive(:new).with(options).and_return(creds)

    user = double("User")
    user.should_receive(:credentials=).with(creds)
    user.should_receive(:save!)

    User.should_receive(:new).and_return(user)

    subject.execute(session)
  end

  it "replaces active record unique error with user error" do
    User.stub(:new).and_raise(ActiveRecord::RecordNotUnique)

    expect { subject.execute(session) }.to raise_error(UserError, /already exists/i)
  end

end
