Feature: Expense tracking

  Scenario: Simple split
    Given a group with members "pat, jenny, and priscilla"
    When "pat" pays "$90.00" for the electric
    Then "jenny" should owe "pat" "$30.00"
    And "priscilla" should owe "pat" "$30.00"
    And "jenny" should not owe "priscilla" anything
    And "priscilla" should not owe "jenny" anything
    And "pat" should not owe "jenny" anything
    And "pat" should not owe "priscilla" anything

  Scenario: Two users with even expenses
    Given a group with members "pat, jenny, and priscilla"
    When "pat" pays "$90.00" for the electric
    And "jenny" pays "$90.00" for cable
    Then "priscilla" should owe "pat" "$30.00"
    And "priscilla" should owe "jenny" "$30.00"
    And "jenny" should not owe "pat" anything
    And "jenny" should not owe "priscilla" anything
    And "pat" should not owe "jenny" anything
    And "pat" should not owe "priscilla" anything

  Scenario: All members with different expenses
    Given a group with members "pat, jenny, and priscilla"
    When "pat" pays "$90.00" for the electric
    And "jenny" pays "$15.00" for cable
    And "priscilla" pays "$12.00" for heat
    Then "jenny" should owe "pat" "$25.00"
    And "priscilla" should owe "pat" "$26.00"
    And "priscilla" should owe "jenny" "$1.00"
    And "jenny" should not owe "priscilla" anything
    And "pat" should not owe "jenny" anything
    And "pat" should not owe "priscilla" anything
