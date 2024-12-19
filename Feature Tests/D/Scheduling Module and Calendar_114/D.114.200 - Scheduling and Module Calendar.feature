Feature: D.114.200  Re-scheduling and Calendar 
    Scenario: The system shall support the ability to view and edit the schedule in calendar
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    When I click on the link labeled "View Record Home Page"
    Then I should see "Record Home Page"

    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    And I select the dropdown option "Confirmed" for the Data Collection Instrument field labeled "Status"
    And I click on the button labeled "Save Status"
    And I close the window
    And I click on the link labeled "1 (Enrollment)"
    And I should see "Status:	Confirmed"
    When I close the window
    Then I should see a table header and rows containing the following values in a table:
      | Day         | Time    | Description                  |                                     
      | Mon Nov 20	| 1:30pm  |	[small_tick] 1 (Enrollment)  |
    When I click on the link labeled "1 (Enrollment)"
    Then I click on the bubble for "Demographics" in the Data Entry Forms section
    And I should see "Demographics"

    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    When I clear field and enter "14:30" into the data entry form field labeled "Time:"
    And I click on the button labeled "Done"
    Then I click on the button labeled "Save Time"
    And I close the window

    Given I click on the link labeled "1 (Enrollment)"
    And I enter "Check up" into the data entry form field labeled "Notes:"
    When I click on the button labeled "Save Notes"
    And I close the window
    #M: refresh browser page
    #We need this line so that we know the page has refreshed
    Then I should see a table header and rows containing the following values in a table:
      | Day         | Time    | Description                            |                                     
      | Mon Nov 20	| 1:30pm  |	[tick_small] 1 (Enrollment) - Check up |
    
    Given I click on the tab labeled "Week"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    When I click on the link labeled "View Schedule"
    Then I should see 'Then I should see "Record Home Page"'
    
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    When I click on the link labeled "View Record Home Page"
    Then I should see "Record Home Page"

    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    And I select the dropdown option "Scheduled" for the Data Collection Instrument field labeled "Status"
    And I click on the button labeled "Save Status"
    And I close the window
    And I click on the link labeled "1 (Enrollment)"
    And I should see "Status:	Scheduled"
    When I close the window
    #below table needs a proper look at
    Then I should see a table header and rows containing the following values in a table:
      | Day         | Time    | Description                  |                                     
      | Mon Nov 20	| 1:30pm  |	[star_small] 1 (Enrollment)  |
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                       | Tuesday                       | Wednesday                     | Thursday  | Friday    | Saturday  |                                    
      | + New 	19| + New 20 [star_small] 1:30pm 1 (Enrollment)  |	+ New 21 3:00pm 1 (Baseline) | + New 	22 2:00pm  1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 | 
 
    When I click on the link labeled "1 (Enrollment)"
    Then I click on the bubble for "Demographics" in the Data Entry Forms section
    And I should see "Demographics"
    
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Week"
    And I click on the link labeled "1 (Enrollment)"
    And I click on the link labeled "Change Time"
    And I clear field and enter "16:35" into the data entry form field labeled "Time:"
    And I click on the button labeled "Save Time"
    When I close the window
    #M: refresh browser page
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                        | Tuesday                        | Wednesday                       | Thursday  | Friday    | Saturday  |                                    
      | + New 	19| + New 	20 [star_small] 4:35pm 1 (Enrollment) |	+ New 	21 3:00pm 1 (Baseline) | + New 	22  2:00pm  1 (Visit 1)  | + New 	23 | + New 	24 | + New 	25 | 
    And I enter "New Test" into the data entry form field labeled "Notes:"
    When I click on the button labeled "Save Notes"
    And I close the window
    #M: refresh browser page
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                   | Tuesday                         | Wednesday                     | Thursday  | Friday    | Saturday  |                                    
      | + New 	19| + New 	20 [star_small] 4:35pm 1 (Enrollment) - New Test |	+ New 	21 3:00pm 1 (Baseline) | + New 	22 2:00pm 1 (Visit 1)  | + New 	23 | + New 	24 | + New 	25 | 
    #M: refresh browser page
    # need an addition step here to describe hovering over the link and it displaying the correct information (day 20). 

    Given I click on the tab labeled "Month"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Baseline)"
    When I click on the link labeled "View Schedule"
    Then I should see "View/Edit Existing Schedule"
    
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Month"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Baseline)"
    When I click on the link labeled "View Record Home Page"
    Then I should see "Record Home Page"
    
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Month"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Visit 1)"
    And I select the dropdown option "Cancelled" for the Data Collection Instrument field labeled "Status"
    And I click on the button labeled "Save Status"
    And I close the window
    And I click on the link labeled "1 (Visit 1)"
    And I should see "Status:	Cancelled"
    When I close the window
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                    | Tuesday                         | Wednesday                                    | Thursday  | Friday    | Saturday  |
      |           |                                                           |                                 | + New 	1                                    | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                 | + New 	7                       | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                | + New 	14                      | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [star_small] 4:35pm 1 (Enrollment) - New Test |	+ New 	21 3:00pm 1 (Baseline)  | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                                | + New 	28                      | + New 	29                                   | + New 	30 |           |           |

    When I click on the link labeled "1 (Enrollment)"
    Then I click on the bubble for "Demographics" in the Data Entry Forms section
    And I should see "Demographics"
    
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Month"
    And I click on the link labeled "1 (Baseline)"
    And I click on the link labeled "Change Time"
    And I clear field and enter "18:45" into the data entry form field labeled "Time:"
    And I click on the button labeled "Save Time"
    When I close the window
    #M: refresh browser page
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                    | Tuesday                                      | Wednesday                                    | Thursday  | Friday    | Saturday  |
      |           |                                                           |                                              | + New 	1                                    | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                 | + New 	7                                    | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                | + New 	14                                   | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [star_small] 4:35pm 1 (Enrollment) - New Test |	+ New 	21 6:45pm 1 (Baseline) - Blood Test  | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                                | + New 	28                                   | + New 	29                                   | + New 	30 |           |           |

    Given I click on the link labeled "1 (Baseline)"
    And I enter "Blood Test" into the data entry form field labeled "Notes:"
    When I click on the button labeled "Save Notes"
    And I close the window
    #M: refresh browser page
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                    | Tuesday                                      | Wednesday                                    | Thursday  | Friday    | Saturday  |
      |           |                                                           |                                              | + New 	1                                    | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                 | + New 	7                                    | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                | + New 	14                                   | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [star_small] 4:35pm 1 (Enrollment) - New Test |	+ New 	21 6:45pm 1 (Baseline) - Blood Test  | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                                | + New 	28                                   | + New 	29                                   | + New 	30 |           |           |
    # need an addition step here to describe hovering over the link and it displaying the correct information (day 20). 

    Given I click on the tab labeled "Agenda"
    And I select the dropdown option "November" from the Month dropdown
    When I select the dropdown option "2023" from the Year dropdown
    Then I should see a table header and rows containing the following values in a table:
      | Day         | Time    | Description                                   |                                     
      | Mon Nov 20	| 1:30pm  |	[star_small] 4:35pm 1 (Enrollment) - New Test |
      | Tue Nov 21	| 1:30pm  |	6:45pm 1 (Baseline) - Blood Test              |
      | Wed Nov 22	| 6:45pm  |	[cross_small] 2:00pm 1 (Visit 1)              |
    
    Given I click on the link labeled "1 (Enrollment)"
    And I click on the link labeled "View Schedule"
    Then I should see "View/Edit Existing Schedule"
    
    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Agenda"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Baseline)"
    When I click on the link labeled "View Record Home Page"
    Then I should see "Record Home Page"

    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Agenda"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    And I select the dropdown option "No show" for the Data Collection Instrument field labeled "Status"
    And I click on the button labeled "Save Status"
    And I close the window
    And I click on the link labeled "1 (Enrollment)"
    And I should see "Status:	No show"
    When I close the window
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                         | Tuesday                         | Wednesday                                    | Thursday  | Friday    | Saturday  |
      |           |                                                                |                                 | + New 	1                                     | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                      | + New 	7                        | + New 	8                                     | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                     | + New 	14                       | + New 	15                                    | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [bullet_delete16] 4:35pm 1 (Enrollment) - New Test |+ New 	21 3:00pm 1 (Baseline)   | + New 	22  [cross_small] 2:00pm 1 (Visit 1)  | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                                     | + New 	28                       | + New 	29                                    | + New 	30 |           |           | 

    When I click on the link labeled "1 (Enrollment)"
    Then I click on the bubble for "Demographics" in the Data Entry Forms section
    And I should see "Demographics"

    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Agenda"
    And I click on the link labeled "1 (Enrollment)"
    And I click on the link labeled "Change Time"
    And I clear field and enter "20:00" into the data entry form field labeled "Time:"
    And I click on the button labeled "Save Time"
    When I close the window
    #M: refresh browser page
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                         | Tuesday                                       | Wednesday                                   | Thursday  | Friday    | Saturday  |
      |           |                                                                |                                               | + New 	1                                    | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                      | + New 	7                                      | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                     | + New 	14                                     | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [bullet_delete16] 8:00pm 1 (Enrollment) - New Test |	+ New 	21 6:45pm 1 (Baseline) - Blood Test  | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                                     | + New 	28                                     | + New 	29                                   | + New 	30 |           |           |                    
      
    Given I click on the link labeled "1 (Baseline)"
    And I enter "Nurse check" into the data entry form field labeled "Notes:"
    When I click on the button labeled "Save Notes"
    And I close the window
    #M: refresh browser page
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                                            | Tuesday                                        | Wednesday                                   | Thursday  | Friday    | Saturday  |
      |           |                                                                   |                                                | + New 	1                                    | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                                         | + New 	7                                      | + New 	8                                    | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                                        | + New 	14                                     | + New 	15                                   | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [bullet_delete16] 8:00pm 1 (Enrollment) - Nurse check |	+ New 	21 6:45pm 1 (Baseline) - Blood Test    | + New 	22  [cross_small] 2:00pm 1 (Visit 1) | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                                        | + New 	28                                     | + New 	29                                   | + New 	30 |           |           |
    # need an addition step here to describe hovering over the link and it displaying the correct information (day 20). 