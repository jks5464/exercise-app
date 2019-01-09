Feature: splash_screen
  As a user,
  so I do not see the dashboard before logging in,
  I want a spash screen 
  
  Scenario: I click on sign in from the spash screen
  Given I am on the splash screen page 
  And I press "sign in"
  Then I should be on the dashboard page
  