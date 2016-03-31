Feature: creation and view of families
 
  As a membership director 
  So that I can find initialize a database on new families that I meet
  I want to be able to create and view families
 
Background: families in database
 
  Given the following families exist:
  | name      | people   | status      | phone         | email         | 
  | Johnson   | Walter   | New         | (483)290-8483 | an@email.com  |
  | Hamilton  | Tim, Ben | Prospective | (542)098-4329 | ham@ilton.com |

Scenario: view families
  Given I am on the families home page
  Then  I should see "Johnson"
  Then  I should see "Hamilton"
  Then  I should not see "Xie"

Scenario: add families
  Given I am on the families home page
  When  I follow "Add Family"
  Then  I should be on the new page for "Families"
  And   I fill in "Name" with "Xie"
  And   I press "Add Family"
  Then  I should be on the families home page
  And   I should see "Xie"
  
Scenario: sort families alphabetically
  Given I am on the families home page
  Then I should see "Hamilton" before "Johnson"
  Then I should see "ham@ilton.com" before "an@email.com"