Feature: logout as an Admin
 
  As a BoardBank Admin
  so I can stop using the website
  I want to be able to logout from BoardBank

Background:
	Given  I login as an Admin
	And I am on the admin dashboard
	
Scenario: Logout
	When I follow "Logout"
	  Then I should be on the admin login page
