Given /^a non-logged in user$/i do
  @current_user = nil
end

Given /^a logged in user$/i do
  @current_user = User.create(
    :email    => 'jim@gmail.com',
    :password => 'secret'
  )

  visit '/login'

  fill_in 'email', :with => 'jim@gmail.com'
  fill_in 'password', :with => 'secret'

  click_on 'Login'
end

Given /^an existing user with email "(.*?)" and password "(.*?)"$/i do |email, password|
  User.create(:email => email, :password => password)
end

Then /^they should be logged in$/i do
  visit '/session'
  page.should have_content(/logged in/i)
end
