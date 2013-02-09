Feature: The landing page

  Scenario: Anonymous visitor

    Given A non-logged in user
     When they visit the "landing" page
     Then they should see a button with text "Sign In"
      And they should see a button with text "Sign Up"
      And they should see a link to the "about" page

  Scenario: Authenticated visitor

    Given A logged in user
     When they visit the "landing" page
     Then they should see a link to the "groups" page
      And they should see a link to the "profile" page
      And they should see a link to the "about" page
