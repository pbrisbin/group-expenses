When /^they visit the "(.*?)" page$/i do |page|
  case page
  when "landing"
    visit '/'
  else
    visit "/#{page}"
  end
end

Then /^they should be taken to the "(.*?)" page$/i do |page|
  case page
  when "landing"
    current_path.should == '/'
  else
    current_path.should == "/#{page}"
  end
end
