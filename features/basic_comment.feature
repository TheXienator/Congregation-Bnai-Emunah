Feature: creation of comments to families
 
  As a membership director 
  So that I can write informations about families
  I want to be able to create comments on existing families
 
Background: families in database
  
  Given the following users exist:
  | name  | email             | password  | admin   |
  | Jason | jason@gmail.com   | password  | true    |
  
  And I am on the sign in page
  And I fill in "Email" with "jason@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
 
  Given the following families exist:
  | name      | people   | status      |  phone         | email         | 
  | Johnson   | Walter   | New         |  (483)290-8483 | an@email.com  |
  | Hamilton  | Tim, Ben | Prospective |  (542)098-4329 | ham@ilton.com |

  Given the following comments exist:
  | family    | content                                         | user_id |
  | Johnson   | Walter is the only member of the Johnson family | 1       |
  | Hamilton  | Tim and Ben are identical twins                 | 1       |
  
Scenario: view comments
  Given I am on the "Johnson" family page
  Then I should see "Walter is the only member of the Johnson family"
  Then I should not see "Tim and Ben are identical twins"

Scenario: add comments
  Given I am on the "Johnson" family page
  And I fill in "Comment" with "Walter loves to play golf"
  When I press "Create Comment"
  Then I should be on the "Johnson" family page
  And I should see "Walter loves to play golf"
  
Scenario: most recent comments are displayed first
  Given I am on the "Johnson" family page
  And I fill in "Comment" with "Walter just had a child"
  When I press "Create Comment"
  Then I should see "Walter just had a child" before "Walter is the only member"
  
Scenario: update comments
  Given I am on the "Johnson" family page
  And I follow "Edit"
  And I fill in "Comment" with "Walter is the only living member"
  When I press "Update Comment"
  Then I should be on the "Johnson" family page
  Then I should see "Walter is the only living member"
  Then I should not see "Walter is the only member"
  
Scenario: delete comments
  Given I am on the "Johnson" family page
  And I follow "Delete"
  Then I should be on the "Johnson" family page
  Then I should not see "Walter is the only member"