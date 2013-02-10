When /^they click "(.*?)"$/i do |button|
  click_on(button)
end

When /^they fill in "(.*?)" as "(.*?)"$/i do |name, content|
  fill_in(name, :with => content)
end

Then /^they should see a button with text "(.*?)"$/i do |text|
  page.should have_button(text)
end

Then /^they should see a link with text "(.*?)"$/i do |text|
  page.should have_link(text)
end
