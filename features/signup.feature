Feature: Sign up

  Scenario: Getting to Sign up
    Given A non-logged in user
     When They visit the "landing" page
      And They click "Sign Up"
     Then They should be taken to the "signup" page

  Scenario: Signing up
    Given A non-logged in user
      And No existing user with email "foo"
     When They visit the "signup" page
      And They fill in "email" as "foo"
      And They fill in "password" as "bar"
      And They fill in "password_confirmation" as "bar"
      And They click "Sign up"
     Then They should be taken to the "landing" page
      And They should be logged in
      And A user with email "foo" should exist
