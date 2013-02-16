Given /^a non-logged in user$/i do
end

Given /^a logged in user$/i do
  credentials = Credentials.new(
    :email    => 'jim@gmail.com',
    :password => 'secret',
    :confirm  => 'secret'
  )

  @user = User.new
  @user.credentials = credentials
  @user.save!

  visit '/login'

  fill_in 'email', :with => 'jim@gmail.com'
  fill_in 'password', :with => 'secret'

  click_on 'Login'
end

Given /^an existing user with email "(.*?)" and password "(.*?)"$/i do |email, password|
  credentials = Credentials.new(
    :email    => email,
    :password => password,
    :confirm  => password
  )

  user = User.new
  user.credentials = credentials
  user.save!
end

Given /^No existing user with email "(.*?)"$/ do |email|
  if user = User.find_by_email(email)
    user.delete
  end
end

Given /^that user has (\d+) groups$/i do |n|
  n.to_i.times do |i|
    group = Group.new
    group.name = "Group #{i+1}"

    @user.groups << group
  end

  @user.save!
end

Then /^A user with email "(.*?)" should exist$/ do |email|
  User.find_by_email(email).should_not be_nil
end

Then /^they should be logged in$/i do
  visit '/session'
  page.should have_content(/logged in/i)
end
