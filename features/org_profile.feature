Feature: Access Organization Profile

   As a BoardBank Organization
   So I can see what information I've uploaded
   I want to be able to view my profile

Background:
	Given I login as an Organization
	And I am on the homepage

Scenario: View Profile
	  When I follow "Profile"
	  And I should see "Email"