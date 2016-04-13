Feature: creation and view of users
 
  As an organization leader
  So that I can allow my officials to create accounts and work independently
  I want to be able to create users
 
Background: users in database
 
  Given the following users exist:
  | name  | email             | password  | admin   |
  | Jason | jason@gmail.com   | password  | true    |
  | Tim   | tim@gmail.com     | password  | false   |
  
  Given the following families exist:
  | name      | people   | status      | phone         | email         | 
  | Johnson   | Walter   | New         | (483)290-8483 | an@email.com  |
  | Hamilton  | Tim, Ben | Prospective | (542)098-4329 | ham@ilton.com |

Scenario: I can log in to an existing account
  Given I am on the sign in page
  And I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  Then I should be on the home page