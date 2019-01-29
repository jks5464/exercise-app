Feature: splash_screen
  As a user,
  so I do not see the dashboard before logging in,
  I want a splash screen 
  
  @omniauth_test
  Scenario: I click on sign in from the splash screen
  Given I am on the splash screen page 
  And A user with name "Constantina Test" and UID "2" and auth provider "google_oauth2"
  And I login using "google_oauth2" as the user
  And I click the link "Sign out"
  Then I should see "Sign in with Google" within "div.login"
  And I should be on the home page
  
  