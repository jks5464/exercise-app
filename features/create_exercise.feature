Feature: create an exercise
  
  As a user
  So that I can do an exercise
  I want to create a new exercise

@omniauth_test 
Scenario: I click on create exercise
  
  Given I login and am on the create workout page
  When I press "Create Exercise"
  Then I should be on the create exercise page
  
@omniauth_test 
Scenario: I enter a new exercise
  
  Given I login and am on the create exercise page
  When I enter "Sit ups" into "name"
  And I choose "Cardio"
  And I press "Enter"
  Then I should be on the create workout page
  