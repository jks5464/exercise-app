Feature: Enter a Goal

  As a user, 
  So that I can establish a fitness goal by a certain date (50% body fat by march 12 - spring break), 
  I want to to create a fitness goal in my account.

@omniauth_test
Scenario: I select the add goal button from the my goal page
  Given I login and am on the my goals page
  And I press "Add Goal"
  Then I should see "Name" within "div.enter_goal"
  And I should see "Description" within "div.enter_goal"
  And I should be on the enter goal page
  
@omniauth_test
Scenario: I enter a valid goal
  Given I login and am on the enter goal page 
  And I enter "Big by Spring Break" into "name"
  And I enter "This goal means alot to me. You can do it!" into "description"
  And I enter "Bench Press" into "exercise"
  And I enter "50" into "value"
  And I enter "lbs" into "unit"
  And I enter "2019-03-12" into "date"
  And I press "Enter"
  Then I should see "Big by Spring Break" within "div.goals"
  And I should see "Timeline" within "div.goals"
  And I should see "Progress" within "div.goals"
  And I should be on the my goals page
  
 
@omniauth_test
Scenario: I enter an invalid goal
  Given I login and am on the enter goal page 
  And I enter "Big by Spring Break" into "name"
  And I enter "This goal means alot to me. You can do it!" into "description"
  And I enter "Bench Press" into "exercise"
  And I enter "invalid value" into "value"
  And I enter "lbs" into "unit"
  And I enter "03/12/2019" into "date"
  And I press "Enter"
  Then I should see "Invalid goal" within "div#flash_error"
  And I should be on the enter goal page