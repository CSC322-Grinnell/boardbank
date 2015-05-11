Feature: Edit Profile as a User
 
  As a BoardBank User
  So I can keep my info up to date
  I want to be able to edit my profile

Background:
	Given  I login as a User
	And I am on the home page
@wip	
Scenario: Edit profile
	  When I follow "Profile"
	  And I follow "Edit Profile"
	   And I fill in "user_firstname" with "User"
	   And I fill in "user_lastname" with "Joe"
	   And I fill in "user_address" with "123 userville"
	   And I fill in "user_city" with "Userton"
	   And I select "Alabama" from "user_state"
	   And I fill in "user_zipcode" with "90210"
	   And I fill in "user_phonenumber" with "555-555-5555"
	   And I select "Bachelors" from "user_education"
	   And I fill in "user_areaofstudy" with "Magic"
	   And I check "interest_2"
	   And I check "user_previous_experience"
	   And I fill in "user_current_password" with "password"
	   And I press "Update"
	   Then I should see "Your account has been updated successfully."
		And I should be on the homepage
