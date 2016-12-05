Feature: Edit Profile as a User
 
  As a BoardBank User
  So I can keep my info up to date
  I want to be able to edit my profile

Background:
	Given  I login as a User
	And I am on the home page
	
Scenario: Correct edit profile display
	  When I follow "Profile"
	  And I follow "Edit Profile"
	    Then I should see "Informtion Technology"
	  
	  
Scenario: Edit profile happy case, no password provided
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
	   And I check "user_previous_experience"
	   And I check "user_financial_contribution"
	   And I choose "user_user_skills_attributes_7_experience_level_some" 
	   #Information Technology
	   And I check "interest_14" 
	   #Disabilities
	   And I press "Update"
	   Then I should see "Your account has been updated successfully."
		And I should be on the user profile page
		And I should see "User Joe"
		#Section: -------------------------------=------------------------------
		And I should see "Basic:"
		And I should see "Userton, Alabama"
		And I should see "555-555-5555"
		#Section ---------------------------------------------------------------
		And I should see "Education:" 
		And I should see "Bachelors"
		And I should see "Specialization: Magic"
		#Section ---------------------------------------------------------------
		And I should see "Interests:"
		And I should see "Disabilities"
		And I should not see "Animal Rights"
		#Section ---------------------------------------------------------------
		And I should see "Skills:" 
		And I should see "Information Technology"
		And I should not see "Communications"
		#Section ---------------------------------------------------------------
		And I should see "Other:" 
		And I should see "Comfortable financially contributing to board."
		And I should not see "Comfortable with a fundraising board"
		And I should see "Additional comments:"
Scenario: Change password with incorrect current password
	When I follow "Profile"
	   And I follow "Edit Profile"
	   And I fill in "user_current_password" with "badpassword"
	   And I fill in "user_password" with "password2"
	   And I fill in "user_password_confirmation" with "password2"
	   And I press "Update"
	   Then I should see "Update unsuccessful."
	   		And I should be on the user profile page.
Scenario: Change password with not matching passwords
    When I follow "Profile"
	   And I follow "Edit Profile"
	   And I fill in "user_current_password" with "password"
	   And I fill in "user_password" with "password3"
	   And I fill in "user_password_confirmation" with "password4"
	   And I press "Update"
	   Then I should see "Update unsuccessful."
	   		And I should be on the user profile page.
Scenario: Change password
	When I follow "Profile"
	   And I follow "Edit Profile"
	   And I fill in "user_firstname" with "ChangedUser"
	   And I fill in "user_current_password" with "password"
	   And I fill in "user_password" with "password2"
	   And I fill in "user_password_confirmation" with "password2"
	   And I press "Update"
	   Then I should see "Your account has been updated successfully."
		And I should be on the user profile page
		And I should see "ChangedUser"
		When I follow "Edit Profile"
			And I fill in "user_current_password" with "password2"
			And I press "Update"
			Then I should see "Your account has been updated successfully."
			
#Scenario: Hide phone number
#	When I follow "Pofile"
#		And I follow "Edit Profile"
#		And I fill in "user_phonenumber" with "555-555-5555"

	

