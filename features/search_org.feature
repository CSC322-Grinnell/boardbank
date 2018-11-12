Feature: Search for orgs

  As a BoardBank User
  So I can see organizations I am interested in
  I want to be able to search the list of orgs

Background:
	Given I login as an Organization
	And I am on the homepage
	Given the following organizations exist:
	|OName             | About                         | Email     | Password | Interests 		| Approved	|
	|Happy Makers      | Making people happy           | hm@hm.com | password | Animal Rights 	| true		|
	|Animal Shelter    | Rescuing stray dogs           | as@as.com | password | Recreation		| true		|
	|L0vely            | Nerd dating app	           | L0@ve.com | password | Education 		| true		|
	|Mary's Cupcakes   | Free cookies for all children | mc@mc.com | password | Animal Rights 	| true		|


Scenario: Search List of Orgs
	  When I follow "Organizations"
	  Then I should be on the Organizations page
	  And I should see "List of Organizations"
	  And I should see "Happy Makers"
	  When I fill in "search" with "Making"
	  And I press "search"
	  Then I should see "hm@hm.com"
	  And I should not see "l0@ve.com"
	  