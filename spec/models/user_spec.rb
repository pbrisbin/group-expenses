require 'spec_helper'
require_model_for(__FILE__)

describe User do
  it "can be created and subsequently found" do
    user = User.create(
      :email    => 'email',
      :password => 'password'
    )

    User.find('email').should == user
  end

  it "can be created without persisting" do
    user = User.create(
      :email    => 'email2',
      :password => 'password',
      :persist  => false
    )

    User.find('email2').should be_nil
  end

  it "knows when it's password is valid" do
    user = User.new('email', 'password')

    user.valid_password?('password').should be_true
    user.valid_password?('wrong').should be_false
  end
end
