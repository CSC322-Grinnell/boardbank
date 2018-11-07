Feature: back-button directs correctly

  As a BoardBank User or Organization
  So that I can use the website
  I want to be able to use the back buttons to navigate around the website

Scenario: Follow back button on the user signup page
          Given I am on the sign up page
          When I follow "Back"
          Then I should be on the home page

Scenario: Follow back button on the organization signup page
          Given I am on the organization sign up page
          When I follow "Back"
          Then I should be on the home page

Scenario: Follow back button on the user login page
          Given I am on the user login page
          When I follow "Back"
          Then I should be on the home page

Scenario: Follow back button on the organization login page
          Given I am on the organization login page
          When I follow "Back"
          Then I should be on the home page

Scenario: Follow back button on the user profile edit page from home page
          Given I login as a User
          And I am on the home page
          And I follow "Edit Profile"
          When I follow "Back"
          Then I should be on the home page

Scenario: Follow back button on the user profile edit page from profile page
          Given I login as a User
          And I am on the user profile page
          And I follow "Edit Profile"
          When I follow "Back"
          Then I should be on the user profile page

Scenario: Follow back button on the organization profile edit page from organization profile page
          Given I login as an Organization
          And I am on the home page
          And I follow "Profile"
          And I follow "Edit Profile"
          When I follow "Back"
          Then I should be on the organization profile page
