Feature: To view all the comments
 
  I should see all the comments in the allcomments page, in time reserve order
 
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
  
Scenario: view all comments link working
  Given I am on the families page
  Then I should see "All comments"
  When I follow "All comments"
  Then I should be on all comments page
  
Scenario: see all the comments
  Given I am on all comments page
  Then I should see "Walter is the only member of the Johnson family"
  And I should see "Tim and Ben are identical twins"
  
# Scenario: comments ordering
#   Given I am on the "Johnson" family page
#   And I fill in "Comment" with "Walter just had a child"
#   When I press "Create Comment"
#   When I follow "All comments"
#   Then I should see "Walter just had a child" before "Walter is the only member"
  