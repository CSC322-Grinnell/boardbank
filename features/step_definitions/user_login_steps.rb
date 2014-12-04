	Given(/^an account exists with email: "(.*?)" and password: "(.*?)"$/) do |email, password|
	   user = User.create(email: email, password: password)
	end

	Given(/^an organization exists with email: "(.*?)" and password: "(.*?)"$/) do |email, password|
	   user = Organization.create(email: email, password: password, approved: true)
	end

	Given(/^an unapproved organization exists with email: "(.*?)" and password: "(.*?)"$/) do |email, password|
	   user = Organization.create(email: email, password: password, approved: false)
	end

	Given(/^I login as a User$/) do

		steps %Q{
		Given I am on the login page
			  And an account exists with email: "user@example.com" and password: "password"
			When I fill in "Email" with "user@example.com"
				  And I fill in "Password" with "password"
				  And I press "Sign in"
				  Then I should be on the homepage
				    And I should see "Signed in successfully."
		        }
	end

		Given(/^I login as an Organization$/) do

		steps %Q{
		Given I am on the organization login page
			  And an organization exists with email: "org@example.com" and password: "password"
			When I fill in "Email" with "org@example.com"
				  And I fill in "Password" with "password"
				  And I press "Sign in"
				  Then I should be on the homepage
				    And I should see "Signed in successfully."
		        }
	end

		Given(/^I login as an Admin$/) do

		steps %Q{
		Given I am on the Admin login page
			  And an admin user "admin@example.com" exists
			When I fill in "Email" with "admin@example.com"
				  And I fill in "Password" with "password"
				  And I press "Login"
 		  	 Then I should be on the admin dashboard
		        }
		end
