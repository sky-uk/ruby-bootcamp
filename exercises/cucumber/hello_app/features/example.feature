Feature: Cucumber example
  As a user
  I want to select a picture from the home page
  So that I can view the full picture

  Scenario: Show the selected picture
    Given I am on the home page
    When I click 'Show' on the 'Laptop' picture
    Then I expect to see the 'Laptop' picture