module AccountHelpers
  attr_accessor :signed_in_as

  def sign_up(name)
    sign_out

    visit '/'
    click_on 'Sign up'

    fill_in 'Email', :with => "#{name}@example.com"
    fill_in 'Password', :with => "#{name}_pw"
    fill_in 'Confirmation', :with => "#{name}_pw"

    click_on 'Sign up'

    self.signed_in_as = name
  end

  def sign_in(name)
    return if signed_in_as == name

    sign_out

    visit '/'
    click_on 'Sign in'

    fill_in 'Email', :with => "#{name}@example.com"
    fill_in 'Password', :with => "#{name}_pw"

    click_on 'Login'

    self.signed_in_as = name
  end

  def sign_out
    return if signed_in_as.nil?

    visit '/'

    click_on 'Sign out'

    self.signed_in_as = nil
  end
end

World(AccountHelpers)
