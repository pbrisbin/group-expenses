Then /^"(.*)" should owe "(.*)" "(.*)"$/i do |ower, owee, amount|
  sign_in(ower)

  visit '/'

  page.should have_content("You owe #{owee}@example.com #{amount}")

  sign_in(owee)

  visit '/'

  page.should have_content("#{ower}@example.com owes you #{amount}")
end

Then /^"(.*)" should not owe "(.*)" anything$/i do |ower, owee|
  sign_in(ower)

  visit '/'

  page.should_not have_content("You owe #{owee}@example.com")

  sign_in(owee)

  visit '/'

  page.should_not have_content("#{ower}@example.com owes you")
end
