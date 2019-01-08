Feature: User Login

  As a user, 
  So that I can keep track of and maintain information between sessions, 
  I want to have my own account that I can log into.

@omniauth_test
Scenario: Zac Steer Log In
  Given A user with name "Zac Steer" and UID "1" and auth provider "google_oauth2"
  And I am on the home page
  And I login using "google_oauth2" as the user
  Then I should see "Signed in as Zac Steer!"
  And I should see "Sign out"
  And I should be on the home page