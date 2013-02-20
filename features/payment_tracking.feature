Feature: Payment tracking

  Scenario: Simple split and repayment
    Given a group with members "pat, jenny, and priscilla"
    When "pat" pays "$90.00" for the electric
    And "jenny" pays "pat" "$30.00"
    Then "jenny" should not owe "pat" anything
