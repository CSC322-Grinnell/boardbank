Feature: logout as a User
 
  As a BoardBank User
  So that I can stop using the website
  I want to be able to logout from BoardBank

Background:
	Given  I login as a User
	And I am on the homepage
	
Scenario: Logout
	When I follow "Sign Out"
	  Then I should see "Signed out successfully"

