Feature: Acess User Profile
 
  As a BoardBank User
  So I can see what information I've uploaded
  I want to be able to view my profile.

Background:
	Given  I login as a User
	And I am on the homepage
	
Scenario: View Profile
	When I follow "Profile"
	  And I should see "Basic:"
	  And I should see "Education:"
	  And I should see "Skills:"
	  And I should see "user@exam.com"
Scenario: Attempt to view another user's profile
	When I attempt to view another user's profile
		And I should see "user@exam.com"

