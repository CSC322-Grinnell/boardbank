Feature: View User Profile

   As a BoardBank Organization
   So I can see more information about a particular user
   I want to be able to view their profile

Background:
	Given I login as an Organization
	And I am on the homepage
	Given the following users exist:
	|FName  | LName       | Email            | Password |
	|Leo    | Bucci       | leo@bucci.com    | password |
	|Enuj   | Lemonbottom | enuj@lemon.com   | password |
	|L0vely | Nerd	      | L0vely@nerd.com  | password |
	|Alex   | Freecookies | alex@cookies.com | password |

Scenario: View Profile
	  When I follow "Users"
	  Then I should be on the Users page
	  When I follow "leo@bucci.com"
	  And I should see "Leo"
	  And I should see "Bucci"
	  And I should see "leo@bucci.com"
	  And I should not see "Lemonbottom"