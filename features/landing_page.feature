Feature: The landing page

  Scenario: Anonymous visitor

    Given A non-logged in user
     When they visit the "landing" page
     Then they should see a link with text "Sign In"
      And they should see a link with text "Sign Up"
      And they should see a link with text "About"

  Scenario: Authenticated visitor

    Given A logged in user
     When they visit the "landing" page
     Then they should see a link with text "Your groups"
      And they should see a link with text "Your profile"
      And they should see a link with text "About"
