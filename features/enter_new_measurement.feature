Feature: enter a new measurement

  As a user
  So that I can track the following variants: weight, body fat, and calories burned daily
  I want to be able to log them

Scenario: I click on enter new measurements

  Given I am on the my measurements page
  When I press "Enter New Measurements"
  Then I should be on the enter measurements page
  
Scenario: I enter in new measurements

  Given I am on the enter measurements page
  When I enter "130" into "weight"
  And I enter "20" into "body_fat"
  And I enter "6" into "height"
  And I press "Enter"
  Then I should be on the my measurements page
  And I should see "130"
  And I should see "20"
  And I should see "6"
  
  


  
