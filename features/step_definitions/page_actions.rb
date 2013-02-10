When /^they visit the "(.*?)" page$/i do |page|
  case page
  when "landing"
    visit '/'
  when "login"
    visit '/login'
  else
    raise "Unknown page: #{page}"
  end
end

Then /^they should see a button with text "(.*?)"$/i do |text|
  page.should have_button(text)
end

Then /^they should see a link with text "(.*?)"$/i do |text|
  page.should have_link(text)
end

When /^they click "(.*?)"$/i do |button|
  click_on(button)
end

Then /^they should be taken to the "(.*?)" page$/i do |page|
  case page
  when "landing"
    current_path.should == '/'
  when "login"
    current_path.should == '/login'
  else
    raise "Unknown page: #{page}"
  end
end

Given /^an existing user with email "(.*?)" and password "(.*?)"$/i do |email, password|
  User.create(:email => email, :password => password)
end

When /^they fill in "(.*?)" as "(.*?)"$/i do |name, content|
  fill_in(name, :with => content)
end

Then /^they should be logged in$/i do
  visit '/session'
  page.should have_content(/logged in/i)
end
