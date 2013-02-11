require 'spec_helper'

describe Credentials do
  it "can be initialized with options" do
    credentials = Credentials.new(:email => 'email')

    credentials.email.should == 'email'
  end

  context "when given a password" do
    let(:credentials) do
      Credentials.new(
        :email    => 'email',
        :password => 'secret'
      )
    end

    it "will generate a password hash" do
      credentials.password_hash.should_not be_nil
    end

    it "will generate a salt" do
      credentials.salt.should_not be_nil
    end
  end

  it "will check a password confirmation" do
    options = {
      :email    => 'email',
      :password => 'secret',
      :confirm  => 'secret'
    }

    expect { Credentials.new(options) }.not_to raise_error

    options[:confirm] = 'wrong'

    expect { Credentials.new(options) }.to raise_error(UserError)
  end

  it "can be compared" do
    options = { :email => 'email', :password => 'pw' }

    Credentials.new(options).should == Credentials.new(options)
  end
end
