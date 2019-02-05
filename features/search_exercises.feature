Feature: search_exercises

    As a user, 
    so that I can find exercises, 
    I want to search exercises by muscle groups or name.

@javascript
@omniauth_test
Scenario: I search for an exercise that exists
  Given I login and am on the create workout page
  And the following exercises exists:
  | name                    | category  | description   | user_id   |
  | Bench Press             | Strength  |               | 1         |
  | Squat                   | Strength  |               | 1         |
  And I press "add"
  And I enter "Be" into "exercise-search-txt"
  And I wait for ajax
  Then I should see "Bench Press" within "#exercise-search-results"
  