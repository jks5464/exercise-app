Feature: create a workout
  
  As a user
  So that I can do a workout
  I want to create a new workout
  
Scenario: Click on create workout
  
  Given I am on the my workouts page
  When I press "Create New Workout"
  Then I should be on the create workout page
  
Scenario: I create a workout
  
  Given I am on the create workout page
  When I press "Finish Creating New Workout"
  Then I should be on the my workouts page