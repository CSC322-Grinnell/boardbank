Feature: Sign up to BoardBank as an User
 
  As a future BoardBank User
  So that I can utilize the website
  I want to be able to sign up with my email and create an account.

Background:I am on the sign up page
	Given I am on the sign up page

Scenario: Create a user account
	When I fill in "Email" with "org@example.com"
	  And I fill in "Password" with "password"
	  And I fill in "Password confirmation" with "password"
 	  And I fill in "user_firstname" with "Test"
	  And I fill in "user_lastname" with "User"
	  And I fill in "user_address" with "123 userville"
	  And I fill in "user_city" with "Userton"
	  And I select "Alabama" from "user_state"
	  And I fill in "user_zipcode" with "90210"
	  And I fill in "user_phonenumber" with "555-555-5555"

	  And I press "Sign up"
	  Then I should be on the user profile page
	  And I should see "You have successfully signed up as a prospective board member"


Scenario: Sign up with conflicting passwords
	When I fill in "Email" with "badUser@example.com"
	  And I fill in "Password" with "openSesame"
	  And I fill in "Password" with "closedSesame"
	  And I press "Sign up"
	  Then I should see "Password confirmation doesn't match"

