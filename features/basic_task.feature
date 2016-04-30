Feature: creation of tasks to users
 
  As an administrator
  So that I can assign jobs to my users
  I want to be able to create tasks for them to do
 
Background: families in database
  
  Given the following users exist:
  | name  | email             | password  | admin   |
  | Jason | jason@gmail.com   | password  | true    |
  | Chris | chris@gmail.com   | password  | false   |
  | Terry | terry@gmail.com   | password  | false   |
  
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
  
  Given the following tasks exist:
  | content                           | priority  | user_id | admin_id  | completed |
  | Talk to Johnson                   | Normal    | 2       | 1         | false     |
  | Convince Hamilton to come to mass | Urgent    | 3       | 1         | false     |
  
Scenario: view my tasks
  Given I follow "Sign Out"
  Then I go to the sign in page
  And I fill in "Email" with "chris@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  
  When I go to the profile page
  Then I should see "Talk to Johnson"
  Then I should not see "Convince Hamilton to come to mass"

Scenario: add tasks as an administrator
  Given I am on the user page for "Chris"
  And I fill in "Task" with "Talk to Hamilton"
  When I press "Create Task"
  Then I should be on the user page for "Chris"
  And I should see "Talk to Hamilton"
  
  When I follow "Sign Out"
  And I go to the sign in page
  And I fill in "Email" with "chris@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  
  When I go to the profile page
  Then I should see "Talk to Hamilton"
  Then I should see "Talk to Johnson"

Scenario: update tasks as an administrator
  Given I am on the user page for "Chris"
  And I follow "Edit"
  And I fill in "Task" with "Talk to Hamilton"
  When I press "Update Task"
  Then I should be on the user page for "Chris"
  Then I should see "Talk to Hamilton"
  Then I should not see "Talk to Johnson"
  
Scenario: delete tasks as an administrator
  Given I am on the user page for "Chris"
  And I follow "Delete"
  Then I should be on the user page for "Chris"
  Then I should not see "Talk to Johnson"

Scenario: complete my tasks
  Given I follow "Sign Out"
  Then I go to the sign in page
  And I fill in "Email" with "chris@gmail.com"
  And I fill in "Password" with "password"
  And I press "Log in"
  
  When I go to the profile page
  Then I should see "Pending Tasks:" before "Talk to Johnson"
  Then I should see "Talk to Johnson" before "Completed Tasks:"

  When I press "Finish"
  Then I should see "Completed Tasks:" before "Talk to Johnson"