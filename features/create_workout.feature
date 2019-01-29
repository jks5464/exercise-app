Feature: create a workout
  
  As a user
  So that I can do a workout
  I want to create a new workout

@omniauth_test 
Scenario: Click on create workout
  
  Given I login and am on the my workouts page
  When I press "Create New Workout"
  Then I should be on the create workout page
  
@javascript
@omniauth_test 
Scenario: I create a workout
  
  Given I login and am on the create workout page
  And the following exercises exists:
  | name                    | category  | description   | user_id   |
  | Bench Press             | Strength  |               | 1         |
  | Squat                   | Strength  |               | 1         |
  And I enter "Arm Blaster" into "workout-name"
  And I press "add"
  And I enter "Be" into "exercise-search-txt"
  And I wait for ajax
  Then I should see "Bench Press" within "#exercise-search-results"
  And I send keys down, tab to "#exercise-search-txt"
  And I enter "3" into "sets"
  And I enter "2" into "reps"
  And I enter "1" into "weight"
  And I press "Enter exercise"
  Then I should see "Bench Press 3 2 1"
  
