Feature: dashboard

  As a user, 
  so that I can view informational material from the homepage, 
  I want a dashboard on the homepage.     
  
Scenario: I see my progress on dashboard 
  Given I am on the dashboard page
  Then I should see "My Progress"
    
Scenario: I click on My Goal 
  Given I am on the dashboard page
  And I press "My Goal"
  Then I should be on the my goals page
  
  
Scenario: I click on My Measurement 

  Given I am on the dashboard page
  And I press "My Measurement"
  Then I should be on the my measurements page

 
Scenario: I click on My Workout 

  Given I am on the dashboard page
  And I press "My Workout"
  Then I should be on the my workout page

 
Scenario: I click on My Client 

  Given I am on the dashboard page
  And I press "My Client"
  Then I should be on the my client page

 


  