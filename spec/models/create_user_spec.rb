require 'spec_helper'

class MockListener
  def success; end
  def failure(ex); end
end

describe CreateUser do
  let(:arguments) do
    {
      :email => 'jim@gmail.com',
      :password => 'secret',
      :password_confirmation => 'secret'
    }
  end

  let(:listener) { MockListener.new }

  before do
    if user = User.find(arguments[:email])
      user.delete
    end
  end

  context "with valid arguments" do
    it "should create the user" do
      create_user = CreateUser.new(arguments)
      create_user.create!

      User.find('jim@gmail.com').should_not be_nil
    end

    it "should notify listeners of success" do
      listener.should_receive(:success)

      create_user = CreateUser.new(arguments)
      create_user.subscribe(listener)
      create_user.create!
    end
  end

  context "with an already existing user" do
    before do
      User.create(arguments)
    end

    it "should not create the user" do
      User.should_not_receive(:create)

      create_user = CreateUser.new(arguments)
      create_user.create!
    end

    it "should notify listener of failure" do
      listener.should_receive(:failure)

      create_user = CreateUser.new(arguments)
      create_user.subscribe(listener)
      create_user.create!
    end
  end
end
