Feature: logout as an organization
 
  As a BoardBank Organization
  so I can stop using the website
  I want to be able to logout from BoardBank

Background:
	Given  I am signed in as an Organization
	And I am on the homepage
	
Scenario: Logout
	When I follow "Logout"
	  Then I should see "Signed out successfully"
	  And I should be on the homepage
