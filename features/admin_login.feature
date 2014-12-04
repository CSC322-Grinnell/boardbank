Feature: login to the Admin dashboard
 
  As a BoardBank admin
  So that I can manage the website
  I want to be able to login to the admin dashboard with my email and password.

Background:I am on the admin login page
	  Given I am on the admin login page
 	  And an admin user "admin@example.com" exists

Scenario: Login with correct credentials
	  When I login as an Admin
	  Then I should be on the admin dashboard

Scenario: Login with incorrect credentials
	  When I fill in "Email" with "badAdmin"
	  And I fill in "Password" with "openSesame"
	  And I press "Login"
	  Then I should see "Invalid email or password."

Scenario: Attempt to login without typing an email
          When I fill in "Password" with "passwords"
          And I press "Login"
          Then I should see "Invalid email or password."

Scenario: Attempt to login without typing a password
          When I fill in "Email" with "badAdmin"
	  And I press "Login"
	  Then I should see "Invalid email or password."

