Feature: Acess User Profile
 
  As a BoardBank User
  So I can see what information I've uploaded
  I want to be able to view my profile.

Background:
	Given  I login as a User
	And I am on the homepage
	
Scenario: View Profile
	When I follow "Profile"
	  Then I should be on the profile page.
	  And I should see "First name"
	  And I should see "Last name"
	  And I should see "Email"
