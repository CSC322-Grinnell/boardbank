Feature: Acess User Profile
 
  As a BoardBank User
  So I can see what information I've uploaded
  I want to be able to view my profile.

Background:
	Given  I login as a User
	And I am on the homepage
	
Scenario: View Profile
	When I follow "Profile"
	  And I should see "First Name:"
	  And I should see "Last Name:"
	  And I should see "Email:"
