#Please ignore kept here for referene on cucumber scenarios
Feature: Search for users

  As a BoardBank Organization
  So I can see which users I am interested in
  I want to be able to search the list of users

Background:
	Given I login as an Organization
	And I am on the search
	Given the following users exist:
	|FName  | LName         | Email            | Password | Interests |
	|Leo    | Bob           | leo@bucci.com    | password | Gardening       |
	|Leonel | Bob           | enuj@lemon.com   | password | Environment     |
	|Lio    | Bob	        | l0vely@nerd.com  | password | Education       |
	|Bobcat | Bob           | alex@cookies.com | password | Environment     |

Scenario: Filter List of Users by One checkbox
	  When I type "Bob" in the Search Box
	  And I press the "Search" button
	  Then I should see "Leo"
	  And I should see "Leonel"
	  And I should see "Lio"
	  And I should see "Bobcat"
	  When I check the checkbox "Environment"
	  And I press the filter button
	  Then I should see "Leonel"
	  And I should see "Bobcat"
	  And I should not see "enuj@lemon.com"
	  And I should not see "Lio"
	  
Scenario: Filter List of Users by two checkboxes
	  When I type "Bob" in the Search Box
	  And I press the "Search" button
	  Then I should see "Leo"
	  And I should see "Leonel"
	  And I should see "Lio"
	  And I should see "Bobcat"
	  When I check the checkbox "Environment"
	  And I check the checkbox "Education"
	  And I press the filter button
	  Then I should see "Leonel"
	  And I should see "Bobcat"
	  And I should not see "enuj@lemon.com"
	  And I should see "Lio"