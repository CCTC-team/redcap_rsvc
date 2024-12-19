Feature: D.114.400 Deleting New Calendar Events

Scenario:  The system shall support the ability to delete calendar events
    Given I click on the link labeled "1:00pm 1 -  Test check up "
    When I click on the button labeled "Delete from Calendar"
    And I click on the button labeled "Ok"
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                            | Tuesday                                        | Wednesday                                   | Thursday  | Friday    | Saturday  |
      |           |                                                                   |                                                | + New 	1                                    | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                         | + New 	7                                      | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                        | + New 	14                                     | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [bullet_delete16] 8:00pm 1 (Enrollment) - Nurse check |	+ New 	21 6:45pm 1 (Baseline) - Blood Test    | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27  5:00pm 1 -  Blood check up                            | + New 	28                                     | + New 	29                                   | + New 	30 |           |           |