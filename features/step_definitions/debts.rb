Then /^"(.*)" should owe "(.*)" "(.*)"$/i do |ower, owee, amount|
  sign_in(ower)

  visit '/'

  page.should have_content("You owe #{owee}@example.com #{amount}")

  sign_in(owee)

  visit '/'

  page.should have_content("#{owee}@example.com owes you #{amount}")
end
