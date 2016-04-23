Feature: creation and view of families
 
  As a membership director 
  So that I can find initialize a database on new families that I meet
  I want to be able to create and view families
 
Background: families in database
  
  Given the following users exist:
  | name  | email             | password  | admin   |
  | Jason | jason@gmail.com   | password  | true    |
  
  And I am on the sign in page
  And I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  
  Given the following families exist:
  | name      | people   | status      | phone         | email         | 
  | Johnson   | Walter   | New         | (483)290-8483 | an@email.com  |
  | Hamilton  | Tim, Ben | Prospective | (542)098-4329 | ham@ilton.com |

Scenario: view families
  Given I am on the families page
  Then I should see "Johnson"
  Then I should see "Hamilton"
  Then I should not see "Xie"

Scenario: add families
  Given I am on the families page
  When I follow "Add Family"
  Then I should be on the new page for "Families"
  And I fill in "Name" with "Xie"
  And I fill in "Members" with "Jason"
  And I press "Create Family"
  Then I should be on the families page
  And I should see "Xie"
  
Scenario: update families
  Given I am on the "Johnson" family page
  When I follow "Edit Family"
  Then I should be on the edit page for the "Johnson" family
  And I fill in "Email" with "newJohnson@gmail.com"
  And I press "Update Family"
  Then I should be on the "Johnson" family page
  Then I should not see "an@email.com"
  Then I should see "newJohnson@gmail.com"
  
Scenario: delete families
  Given I am on the "Johnson" family page
  When I press "Delete"
  Then I should be on the families page
  And I should not see "More Info about Johnson Family"
  And I should see "More Info about Hamilton Family"
  
Scenario: sort families alphabetically
  Given I am on the families page
  Then I should see "Hamilton" before "Johnson"
  Then I should see "ham@ilton.com" before "an@email.com"
  
Scenario: search families
  Given I am on the families page
  When I fill in the search box with "Johnson"
  Then I should see "Johnson"
  Then I should not see "Hamilton"