Feature: create an exercise
  
  As a user
  So that I can do an exercise
  I want to create a new exercise
  
Scenario: I click on create exercise
  
  Given I am on the create workout page
  When I press "Create New Exercise"
  Then I should be on the create exercise page
  
Scenario: I enter a new exercise
  
  Given I am on the create exercise page
  When I enter "Sit ups" into "name"
  And I click on "Cardio"
  And I press "Enter"
  Then I should be on the create workout page
  