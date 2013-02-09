Feature: The landing page

  Scenario: Anonymous visitor

    Given A non-logged in user
     When they visit the "landing" page
     Then they should see a button with text "Sign In"
      And they should see a button with text "Sign Up"
      And they should see a link with text "About"

  Scenario: Authenticated visitor

    Given A logged in user
     When they visit the "landing" page
     Then they should see a link with text "Your Groups"
      And they should see a link with text "Your Profile"
      And they should see a link with text "About"
