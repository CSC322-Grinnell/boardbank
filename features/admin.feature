Feature: perform admin actions
  As a BoardBank admin
  So that I can manage the users
  I want to be able to create and delete users

Background: I am logged in to the admin page
            Given I am on the admin login page
            And I login as an Admin
            Then I should be on the admin dashboard

Scenario: Create organization
          When I follow "Organizations"
          Then I should be on the organization admin page
          And I follow "New Organization"
          And I fill in "Email" with "create@org.com"
          And I fill in "organization_password" with "password"
          And I fill in "organization_password_confirmation" with "password"
          And I press "Create Organization"
          And I should see "Organization was successfully created"

Scenario: Create user
          When I follow "Users"
          Then I should be on the user admin page
          And I follow "New User"
          And I fill in "Email" with "create@user.com"
          And I fill in "user_password" with "password"
          And I fill in "user_password_confirmation" with "password"
          And I press "Create User"
          And I should see "User was successfully created"

Scenario: Create admin user
          When I follow "Admin Users"
          Then I should be on the admin user admin page
          And I follow "New Admin User"
          And I fill in "Email" with "create@adminuser.com"
          And I fill in "admin_user_password" with "password"
          And I fill in "admin_user_password_confirmation" with "password"
          And I press "Create Admin user"
          And I should see "Admin user was successfully created"
