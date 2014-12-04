Feature: Sign up to BoardBank as an Organization
 
  As a future BoardBank Organization
  So that I can utilize the website
  I want to be able to sign up with my email and create an account.

Background:I am on the sign up page
	Given I am on the organization sign up page

Scenario: Create an organization account
	When I fill in "Email" with "org@example.com"
	  And I fill in "Password" with "password"
	  And I fill in "Password confirmation" with "password"
          And I fill in "organization_orgname" with "Organization"
          And I fill in "organization_orgabout" with "About us"
          And I fill in "organization_org_contactname" with "Contact Us"
          And I fill in "organization_org_address" with "1234 Five Street"
          And I fill in "organization_org_city" with "Ciudad"
          And I fill in "organization_org_state" with "The Best State Ever"
          And I fill in "organization_org_zipcode" with "12345"
          And I fill in "organization_org_telephone" with "12345678910"
	  And I press "Sign up"
	  Then I should be on the homepage
	    And I should see "signed up successfully."


Scenario: Sign up with conflicting passwords
	When I fill in "Email" with "badOrg@example.com"
	  And I fill in "Password" with "openSesame"
	  And I fill in "Password" with "closedSesame"
	  And I press "Sign up"
	  Then I should see "Password doesn't match confirmation"

