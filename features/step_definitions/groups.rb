Given /^a group with members "(.*)"$/i do |names|
  members = names.split(/ *, *(and *)?/)

  members.each { |name| sign_up(name) }

  creator, *joiners = members

  sign_in(creator)

  click_on 'Start a new group'

  fill_in 'Name', :with => 'Test group'

  click_on 'Create'

  token = find('.group-list-item .token .content').text

  joiners.each do |name|
    sign_in(name)

    click_on 'Join an existing group'

    fill_in 'Token', :with => token

    click_on 'Join'
  end
end
