Feature: View List of Users

   As a BoardBank Organization
   So I can see which users I am interested in
   I want to be able to view the list of user

Background:
	Given I login as an Organization
	And I am on the homepage
	Given the following users exist:
	|FName  | LName       | Email            | Password |
	|Leo    | Bucci       | leo@bucci.com    | password |
	|Enuj   | Lemonbottom | enuj@lemon.com   | password |
	|L0vely | Nerd	      | l0vely@nerd.com  | password |
	|Alex   | Freecookies | alex@cookies.com | password |

Scenario: View List of Users
	  When I follow "Users"
	  Then I should be on the Users page
	  And I should see "List of Users"
	  And I should see "leo@bucci.com"
	  And I should see "enuj@lemon.com"
	  And I should see "l0vely@nerd.com"
	  And I should see "alex@cookies.com"
	  