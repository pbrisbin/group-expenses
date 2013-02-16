Feature: Groups

  Scenario: Getting to groups
    Given A logged in user
     When They visit the "landing" page
      And They click "Your groups"
     Then They should be taken to the "groups" page
