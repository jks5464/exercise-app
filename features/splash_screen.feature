Feature: splash_screen
  As a user,
  so I do not see the dashboard before logging in,
  I want a spash screen 
  
<<<<<<< HEAD
  Scenario: I click on sign in from the spash screen
  Given I am on the splash screen page 
  And I press "sign in"
  Then I should be on the dashboard page
=======
  @omniauth_test
  Scenario: I click on sign in from the spash screen
  Given I am on the splash screen page 
  And A user with name "Constantina Test" and UID "2" and auth provider "google_oauth2"
  And I login using "google_oauth2" as the user
  And I click the link "Sign out"
  Then I should see "Sign in with Google" within "div.login"
  And I should be on the home page
  
>>>>>>> 5237fbba481e3ff26d7098c985734656bf860fbc
  