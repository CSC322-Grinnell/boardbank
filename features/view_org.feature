Feature: View Organization Profile

   As a BoardBank User
   So I can see more information about a particular organization
   I want to be able to view their profile

Background:
	Given I login as a User
	And I am on the homepage
	Given the following organizations exist:
	|OName             | About                         | Email     | Password |
	|Happy Makers      | Making people happy           | hm@hm.com | password |
	|Animal Shelter    | Rescuing stray dogs           | as@as.com | password |
	|L0vely            | Nerd dating app	           | L0@ve.com | password |
	|Mary's Cupcakes   | Free cookies for all children | mc@mc.com | password |

Scenario: View Profile
	  When I follow "Organizations"
	  Then I should be on the Organizations page
	  When I follow "as@as.com"
	  And I should see "Animal Shelter"
	  And I should see "Rescuing stray dogs"
	  And I should see "as@as.com"