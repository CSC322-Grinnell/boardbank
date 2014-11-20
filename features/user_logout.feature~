Feature: logout as a User
 
  As a BoardBank User
  So that I can stop using the website
  I want to be able to logout from BoardBank

Background:
	Given  I am signed in as a User
	And I am on the homepage
	
Scenario: Logout
	When I follow "Logout"
	  Then I should see "Signed out successfully"
	  And I should be on the homepage
