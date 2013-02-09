When(/^they visit the "(.*?)" page$/i) do |page|
  case page
  when "landing"
    visit '/'
  else
    raise "Unknown page: #{page}"
  end
end

Then(/^they should see a button with text "(.*?)"$/i) do |text|

  page.should have_button(text)

end

Then(/^they should see a link to the "(.*?)" page$/i) do |path|

end
