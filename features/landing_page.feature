Feature: The landing page

  Scenario: Anonymous visitor

    Given A non-logged in user
     When they visit the "landing" page
     Then they should see a link with text "Sign in"
      And they should see a link with text "Sign up"
      And they should see a link with text "About"

  Scenario: Authenticated visitor

    Given A logged in user
     When they visit the "landing" page
     Then they should see a link with text "Your groups"
      And they should see a link with text "About"
