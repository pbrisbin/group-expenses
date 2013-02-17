Feature: Expense tracking

  Scenario: Simple split
    Given a group with members "pat, jenny, and priscilla"
    When "pat" pays "$90.00" for the electric
    Then "jenny" should owe "pat" "$30.00"
    And "jenny" should owe "priscilla" "$0.00"
    And "priscilla" should owe "pat" "$30.00"
    And "priscilla" should owe "jenny" "$0.00"
    And "pat" should owe "jenny" "$0.00"
    And "pat" should owe "priscilla" "$0.00"
