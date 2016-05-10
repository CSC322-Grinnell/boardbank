Feature: Filter org

   As a BoardBank Organization
   So I can see which users I am interested in
   I want to be able to filter the search results of users

Background:
	Given I login as a User
	And I am on the homepage
	Given the following organizations exist:
	|OName             | About                         | Email     | Password | Interests 		|
	|Happy Makers      | Making people happy           | hm@hm.com | password | Animal Rights 	|
	|Animal Shelter    | Rescuing stray dogs           | as@as.com | password | Recreation		|
	|L0vely            | Nerd dating app	           | L0@ve.com | password | Education 		|
	|Mary's Cupcakes   | Free cookies for all children | mc@mc.com | password | Animal Rights 	|


Scenario: Filter list of Organizations by one checkbox
	  When I follow "Users"
	  Then I should be on the Users page
	   When I type "Bob" in the "search box"
	  And I press "Search" 
	  Then I should see "List of Users"
	  #When I check "interest-2"
	  When I check "Recreation"
	  And I press "Filter" 
	  Then I should see "as@as.com"
	  And I should not see "hm@hm.com"
	  And I should not see "L0@ve.com"
	  And I should not see "mc@mc.com"



Scenario: Filter list of organizations by two checkboxes
	  When I follow "Users"
	  Then I should be on the Users page
	  When I type "Bob" in the "search box"
	  And I press "Search" 
	  Then I should see "List of Users"
	  #When I check "interest-2"
	  When I check "Animal Rights"
	  And I check "Education"
	  And I press "Filter" 
	  Then I should not see "as@as.com"
	  And I should see "hm@hm.com"
	  And I should see "L0@ve.com"
	  And I should see "mc@mc.com"

	  
	
Scenario: Filter list of organizations by checkboxes such that no organizations appear
	  When I follow "Users"
	  Then I should be on the Users page
	  When I type "Bob" in the "search box"
	  And I press "Search" 
	  Then I should see "List of Users"
	  #When I check "interest-2"
	  When I check "Disabilities"
	  And I press "Filter" 
	  Then I should not see "as@as.com"
	  And I should not see "hm@hm.com"
	  And I should not see "L0@ve.com"
	  And I should not see "mc@mc.com" 
