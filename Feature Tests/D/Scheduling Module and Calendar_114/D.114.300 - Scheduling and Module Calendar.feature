Feature: D.114.300  Adding New Calendar Events

Scenario:  The system shall support the ability to add new calendar events
    Given I click on the tab labeled "Week"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "1" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the first button labeled "+ New"
    And I clear field and enter "13:00" into the data entry form field labeled "Time:"
    And I enter "Test check up" into the data entry form field labeled "Notes:"
    And I select the dropdown option "1" for the Data Collection Instrument field labeled "Select a previously scheduled Study ID:"
    When I click on the button labeled "Add Calendar Event"
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday           | Tuesday                         | Wednesday                          | Thursday  | Friday    | Saturday  |                                    
      |           |                  |	                               | + New 	1 1:00pm 1 -  Test check up | + New 	2 | + New 	3 | + New 	4 | 
    # need an addition step here to describe hovering over the link and it displaying the correct information (day 1). 
    
    Given I click on the tab labeled "Month"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on button labeled "+ New" on the 27th
    # new step required above, dont know fully how best to do this, can look when we create definitions.
     And I clear field and enter "17:00" into the data entry form field labeled "Time:"
    And I enter "Blood check up" into the data entry form field labeled "Notes:"
    And I select the dropdown option "1" for the Data Collection Instrument field labeled "Select a previously scheduled Study ID:"
    When I click on the button labeled "Add Calendar Event"
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                            | Tuesday                                        | Wednesday                                   | Thursday  | Friday    | Saturday  |
      |           |                                                                   |                                                | + New 	1 1:00pm 1 -  Test check up          | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                         | + New 	7                                      | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                        | + New 	14                                     | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [bullet_delete16] 8:00pm 1 (Enrollment) - Nurse check |	+ New 	21 6:45pm 1 (Baseline) - Blood Test    | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27  5:00pm 1 -  Blood check up                            | + New 	28                                     | + New 	29                                   | + New 	30 |           |           |
    # need an addition step here to describe hovering over the link and it displaying the correct information (day 27). 