Feature: creation and view of users
 
  As an organization leader
  So that I can allow my officials to create accounts and work independently
  I want to have administrators able to create and edit users
 
Background: users in database
 
  Given the following users exist:
  | name  | email             | password  | admin   |
  | Jason | jason@gmail.com   | password  | true    |
  | Tim   | tim@gmail.com     | password  | false   |
  
  Given I am on the sign in page
  
Scenario: I can log in to an existing account
  Given I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  Then I should be on the home page

Scenario: Only administrators can view other users
  Given I fill in "Email" with "tim@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  Then I should not see "Users"
  
  When I follow "Sign Out"
  And I go to the sign in page
  And I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  Then I should see "Users"
  
  When I go to the users page
  Then I should see "Jason"
  Then I should see "Tim"

Scenario: administrators can update users
  Given I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  When I go to the user page for "Tim"
  And I follow "Edit User"
  And I fill in "Name" with "Terry"
  And I fill in "Email" with "terry@gmail.com"
  And I press "Update User"
  Then I should be on the user page for "Terry"
  Then I should see "Terry"
  Then I should not see "Tim"
  
Scenario: administrators can create users
  Given I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  When I go to the users page
  And I follow "Add User"
  And I fill in "Name" with "Tom"
  And I fill in "Email" with "tom@gmail.com"
  And I fill in "Password" with "password"
  And I fill in "Confirm password" with "password"

  And I press "Create User"
  Then I should be on the users page
  Then I should see "Tom"
  
Scenario: administrators can destroy users
  Given I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  
  When I go to the user page for "Tim"
  And I press "Delete User"
  Then I should be on the users page
  Then I should not see "tim@gmail.com"