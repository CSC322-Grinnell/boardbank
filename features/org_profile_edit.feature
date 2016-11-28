Feature: Edit Profile as a Org
 
  As a BoardBank Org
  So I can keep my info up to date
  I want to be able to edit my profile

Background:
	Given  I login as an Organization
	And I am on the home page
	
Scenario: Edit profile happy case
	  When I follow "Profile"
	  And I follow "Edit Profile"
	  And I fill in "organization_name" with "OrgName"
	   And I fill in "organization_contact_name" with "Contact Name"
	   And I fill in "organization_address" with "555 Org Rd"
	   And I fill in "organization_city" with "Orgtown"
	   And I select "California" from "organization_state"
	   And I fill in "organization_zipcode" with "90210"
	   And I fill in "organization_telephone" with "555-867-5309"
	   And I press "Update"
	   Then I should see "Your account has been updated successfully."
		And I should see "OrgName"
		And I should be on the organization profile page
Scenario: Change password with incorrect current password
	When I follow "Profile"
	   And I follow "Edit Profile"
	   And I fill in "organization_current_password" with "badpassword"
	   And I fill in "organization_password" with "password2"
	   And I fill in "organization_password_confirmation" with "password2"
	   And I press "Update"
	   Then I should see "error"
	   And I should be on the organization edit page
Scenario: Change password with not matching passwords
    When I follow "Profile"
	   And I follow "Edit Profile"
	   And I fill in "organization_current_password" with "password"
	   And I fill in "organization_password" with "password3"
	   And I fill in "organization_password_confirmation" with "password4"
	   And I press "Update"
	   Then I should see "error"
	   And I should be on the organization edit page.
Scenario: Change password
	When I follow "Profile"
	   And I follow "Edit Profile"
	   And I fill in "organization_name" with "ChangedOrg"
	   And I fill in "organization_current_password" with "password"
	   And I fill in "organization_password" with "password2"
	   And I fill in "organization_password_confirmation" with "password2"
	   And I press "Update"
	   Then I should see "Your account has been updated successfully."
		And I should be on the organization profile page
		And I should see "ChangedOrg"
		When I follow "Edit Profile"
			And I fill in "organization_current_password" with "password2"
			And I press "Update"
			Then I should see "Your account has been updated successfully."

