Feature: Search for users

  As a BoardBank Organization
  So I can see which users I am interested in
  I want to be able to search the list of users

Background:
	Given I login as an Organization
	And I am on the homepage
	Given the following users exist:
	|FName  | LName       | Email            | Password |
	|Leo    | Bucci       | leo@bucci.com    | password |
	|Enuj   | Lemonbottom | enuj@lemon.com   | password |
	|L0vely | Nerd	      | l0vely@nerd.com  | password |
	|Alex   | Freecookies | alex@cookies.com | password |

Scenario: Search List of Users
	  When I follow "Individuals"
	  Then I should be on the Users page
	  And I should see "List of Individuals"
	  And I should see "Leo"
	  When I fill in "search" with "Enuj"
	  And I press "search"
	  Then I should see "enuj@lemon.com"
	  And I should not see "l0vely@nerd.com"
	  
