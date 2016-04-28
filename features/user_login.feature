Feature: login as a User
 
  As a BoardBank User or Organization
  So that I can use the website
  I want to be able to login to BoardBank with my email and password.

Background:I am on the Sign In page
	Given I am on the login page
	  And an account exists with email: "user@exam.com" and password: "password"
Scenario: Login with correct credentials
	Given I login as a User
	  Then I should be on the homepage
	   And I should see "Signed in successfully."


Scenario: Login with incorrect credentials
	When I fill in "Email" with "badUser"
	  And I fill in "Password" with "openSesame"
	  And I press "Sign in"
	  Then I should see "Invalid email or password."

