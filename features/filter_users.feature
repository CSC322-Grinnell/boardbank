Feature: Filter Users

   As a BoardBank Organization
   So I can see which users I am interested in
   I want to be able to filter the search result of users

Background:
	Given I login as an Organization
	And I am on the homepage
	Given the following users exist:
	|FName  | LName     | Email            | Password | Interests       |
	|Leo    | Bob       | leo@bucci.com    | password | Rap Music       |
	|Enuj   | Bob 		| enuj@lemon.com   | password | Early Childhood |
	|L0vely | Bob	    | l0vely@nerd.com  | password | Enviroment      |
	|Alex   | Bob 		| alex@cookies.com | password | Sports          |
@wip
Scenario: Filter List of Users by One checkbox
	  When I follow "Users"
	  Then I should be on the Users page
	   When I type "Bob" in the "search box"
	  And I press "Search" 
	  Then I should see "List of Users"
	  #When I check "interest-2"
	  When I check "Early Childhood"
	  And I press "Filter" 
	  Then I should see "enuj@lemon.com"
	  And I should not see "l0vely@nerd.com"
	  And I should not see "Leo"
	  And I should not see "Alex"



Scenario: Filter List of Users by two checkboxes
	  When I follow "Users"
	  Then I should be on the Users page
	  When I type "Bob" in the "search box"
	  And I press "Search" 
	  Then I should see "List of Users"
	  #When I check "interest-2"
	  When I check "Early Childhood"
	  And I check "Environment"
	  And I press "Filter" 
	  Then I should see "enuj@lemon.com"
	  And I should see "l0vely@nerd.com"
	  And I should not see "Leo"
	  And I should not see "Alex"
	  
	
Scenario: Filter List of Users by checkboxes such that no users appear
	  When I follow "Users"
	  Then I should be on the Users page
	  When I type "Bob" in the "search box"
	  And I press "Search" 
	  Then I should see "List of Users"
	  #When I check "interest-2"
	  When I check "Literacy"
	  And I press "Filter" 
	  Then I should not see "enuj@lemon.com"
	  And I should not see "l0vely@nerd.com"
	  And I should not see "Leo"
	  And I should not see "Alex"	  
