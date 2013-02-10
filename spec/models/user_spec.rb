require 'spec_helper'

describe User do
  let(:arguments) do
    {
      :email => 'email',
      :password => 'password'
    }
  end

  before do
    if user = User.find('email')
      user.delete
    end
  end

  it "can be created and subsequently found" do
    user = User.create(arguments)

    User.find('email').should == user
  end

  it "can be created without persisting" do
    user = User.create(arguments.merge(:persist => false))
    User.find('email2').should be_nil
  end

  it "knows when it's password is valid" do
    user = User.new('', 'password')

    user.valid_password?('password').should be_true
    user.valid_password?('wrong').should be_false
  end

  it "can be deleted" do
    user = User.create(arguments)

    User.find(arguments[:email]).should_not be_nil

    user.delete

    User.find(arguments[:email]).should be_nil
  end
end
