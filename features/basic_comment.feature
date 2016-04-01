Feature: creation of comments to families
 
  As a membership director 
  So that I can write informations about families
  I want to be able to create comments on existing families
 
Background: families in database
 
  Given the following families exist:
  | name      | people   | status      |  phone         | email         | 
  | Johnson   | Walter   | New         |  (483)290-8483 | an@email.com  |
  | Hamilton  | Tim, Ben | Prospective |  (542)098-4329 | ham@ilton.com |

  Given the following comments exist:
  | family    | content                                         |
  | Johnson   | Walter is the only member of the Johnson family |
  | Hamilton  | Tim and Ben are identical twins                 | 
  
Scenario: view comments
  Given I am on the "Johnson" family page
  Then  I should see "Walter is the only member of the Johnson family"
  Then  I should not see "Tim and Ben are identical twins"

Scenario: add comments
  Given I am on the "Johnson" family page
  And   I fill in "Content" with "Walter loves to play golf"
  When  I press "Add Comment"
  Then  I should be on the "Johnson" family page
  And   I should see "Walter loves to play golf"