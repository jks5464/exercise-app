Feature: User Login

  As a user, 
  So that I can keep track of and maintain information between sessions, 
  I want to have my own account that I can log into.

@omniauth_test
Scenario: Zac Test Log In
  Given an admin user exists
  And A user with name "Zac Test" and UID "2" and auth provider "google_oauth2"
  And I am on the splash screen page
  And I login using "google_oauth2" as the user
  Then I should see "Signed in as Zac Test!" within "div.login"
  And I should see "Sign Out" within "div.login"
  And I should be on the dashboard page
  
@omniauth_test
Scenario: Constantina Test Log In
  Given an admin user exists
  And A user with name "Constantina Test" and UID "3" and auth provider "google_oauth2"
  And I am on the splash screen page
  And I login using "google_oauth2" as the user
  Then I should see "Signed in as Constantina Test!" within "div.login"
  And I should see "Sign Out" within "div.login"
  And I should be on the dashboard page
  
@omniauth_test
Scenario: Zac Test Log Out
  Given A user with name "Zac Test" and UID "1" and auth provider "google_oauth2"
  And I am on the splash screen page
  And I login using "google_oauth2" as the user
  And I click the link "Sign Out"
  Then I should see "Sign in with Google" within "div.login"
  And I should be on the home page
  
@omniauth_test
Scenario: Constantina Test Log Out
  Given A user with name "Constantina Test" and UID "2" and auth provider "google_oauth2"
  And I am on the splash screen page
  And I login using "google_oauth2" as the user
  And I click the link "Sign Out"
  Then I should see "Sign in with Google" within "div.login"
  And I should be on the home page
  