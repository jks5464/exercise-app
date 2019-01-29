Feature: create a workout
  
  As a user
  So that I can do a workout
  I want to create a new workout

@omniauth_test 
Scenario: Click on create workout
  
  Given I login and am on the my workouts page
  When I press "Create New Workout"
  Then I should be on the create workout page
  
@omniauth_test 
Scenario: I create a workout
  
  Given I login and am on the create workout page
  When I press "Finish"
  Then I should be on the my workouts page