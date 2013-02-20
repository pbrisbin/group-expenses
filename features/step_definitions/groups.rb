Given /^a group with members "(.*)"$/i do |names|
  members = names.split(/ *, *(and *)?/)

  members.each { |name| sign_up(name) }

  creator, *joiners = members

  sign_in(creator)

  click_on 'Start a new group'

  fill_in 'Name', :with => 'Test group'

  click_on 'Create'

  join_link = find('a:contains("Join link")')['href']

  joiners.each do |name|
    sign_in(name)

    visit join_link

    click_on 'Join'
  end
end
