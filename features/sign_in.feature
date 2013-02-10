Feature: Sign in

  Scenario: Getting to Sign in
    Given A non-logged in user
     When They visit the "landing" page
      And They click "Sign In"
     Then They should be taken to the "login" page

  Scenario: Signing in
    Given A non-logged in user
      And An existing user with email "foo" and password "bar"
     When They visit the "login" page
      And They fill in "Email" as "foo"
      And They fill in "Password" as "bar"
      And They click "Login"
     Then They should be taken to the "landing" page
      And They should be logged in
