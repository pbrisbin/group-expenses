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
