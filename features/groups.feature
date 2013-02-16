Feature: Groups

  Scenario: Getting to groups
    Given A logged in user
     When They visit the "landing" page
      And They click "Your groups"
     Then They should be taken to the "groups" page

  Scenario: Viewing groups with no groups
    Given A logged in user
      And That user has 0 groups
     When They visit the "groups" page
     Then They should see "Create group"

  Scenario: Viewing groups with groups
    Given A logged in user
      And That user has 2 groups
     When They visit the "groups" page
     Then They should see "Group 1"
      And They should see "Group 2"

  Scenario: New group
    Given A logged in user
      And They visit the "groups" page
      And They click "Create group"
     Then They should be taken to the "groups/new" page
