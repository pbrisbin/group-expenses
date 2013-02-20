# Assumes the payee only has one group setup, otherwise clicking on "New
# expense" would be ambiguous.
When /^"(.*)" pays "(.*)" for (.*)$/i do |payer, amount, stuff|
  sign_in(payer)

  visit '/'

  click_on 'New expense'

  fill_in 'Amount', :with => amount
  fill_in 'Comment', :with => stuff

  click_on 'Submit'
end
