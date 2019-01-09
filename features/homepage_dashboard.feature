Feature: dashboard

  As a user, 
  so that I can view informational material from the homepage, 
  I want a dashboard on the homepage.     
  
Scenario: I see my progress on dashboard 
  
  Given I am on the dashboard page
  Then I should see "my progress"
    
Scenario: I click on My Goals
  
  Given I am on the dashboard page
  And I press "My Goals"
  Then I should be on the my goals page
  
  
Scenario: I click on My Measurements

  Given I am on the dashboard page
  And I press "My Measurements"
  Then I should be on the my measurements page

 
Scenario: I click on My Workouts

  Given I am on the dashboard page
  And I press "My Workouts"
  Then I should be on the my workouts page

 
# Scenario: I click on My Clients

#   Given I am on the dashboard page
#   And I press "My Clients"
#   Then I should be on the my client page

 


  