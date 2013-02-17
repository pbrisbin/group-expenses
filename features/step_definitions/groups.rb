def sign_up(name)
  visit '/'
  click_on 'Sign up'

  fill_in 'Email', :with => "#{name}@example.com"
  fill_in 'Password', :with => "#{name}_pw"
  fill_in 'Confirmation', :with => "#{name}_pw"

  click_on 'Sign up'
end

def sign_in(name)
  visit '/'
  click_on 'Sign in'

  fill_in 'Email', :with => "#{name}@example.com"
  fill_in 'Password', :with => "#{name}_pw"

  click_on 'Login'
end

def sign_out
  visit '/'

  click_on 'Sign out'
end

def separately(name)
  sign_in(name)

  yield

  sign_out
end

Given /^a group with members "(.*)"$/i do |names|

  members = names.split(/ *, *(and *)?/)

  creator, *joiners = members

  members.each do |n|
    sign_up(n)
    sign_out
  end

  token = separately(creator) do
    click_on 'New group'

    fill_in 'Name', :with => 'Test group'

    click_on 'Create'

    find('#join-token').text
  end

  joiners.each do |name|
    separately(name) do
      click_on 'Join group'

      fill_in 'Token', :with => token

      click_on 'Join'
    end
  end
end
