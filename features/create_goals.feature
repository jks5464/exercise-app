Feature: Create a Goal

  As a user, 
  So that I can establish a fitness goal by a certain date (50% body fat by march 12 - spring break), 
  I want to to create a fitness goal in my account.

@omniauth_test
Scenario: Zac Makes a Goal
  Given A user with name "Zac Test" and UID "1" and auth provider "google_oauth2"
  And I am on the home page
  And I login using "google_oauth2" as the user
  Then I should see "Signed in as Zac Test!" within "div.login"
  And I should see "Sign out" within "div.login"
  And I should be on the home page
  
@omniauth_test
Scenario: Constantina Test Log In
  Given A user with name "Constantina Test" and UID "2" and auth provider "google_oauth2"
  And I am on the home page
  And I login using "google_oauth2" as the user
  Then I should see "Signed in as Constantina Test!" within "div.login"
  And I should see "Sign out" within "div.login"
  And I should be on the home page
  
@omniauth_test
Scenario: Zac Test Log Out
  Given A user with name "Zac Test" and UID "1" and auth provider "google_oauth2"
  And I am on the home page
  And I login using "google_oauth2" as the user
  And I click the link "Sign out"
  Then I should see "Sign in with Google" within "div.login"
  And I should be on the home page
  
@omniauth_test
Scenario: Constantina Test Log Out
  Given A user with name "Constantina Test" and UID "2" and auth provider "google_oauth2"
  And I am on the home page
  And I login using "google_oauth2" as the user
  And I click the link "Sign out"
  Then I should see "Sign in with Google" within "div.login"
  And I should be on the home page
  