Feature: dashboard

  As a user, 
  so that I can view informational material from the homepage, 
  I want a dashboard on the homepage.     
  
@omniauth_test
Scenario: I see my progress on dashboard 
  
  Given I login and am on the dashboard page
  Then I should see "my progress"

@omniauth_test    
Scenario: I click on My Goals
  
  Given I login and am on the dashboard page
  And I press "My Goals"
  Then I should be on the my goals page
  
@omniauth_test
Scenario: I click on My Measurements

  Given I login and am on the dashboard page
  And I press "My Measurements"
  Then I should be on the my measurements page

@omniauth_test 
Scenario: I click on My Workouts

  Given I login and am on the dashboard page
  And I press "My Workouts"
  Then I should be on the my workouts page

 


  