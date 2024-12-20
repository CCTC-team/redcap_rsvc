Feature: D.114.100  Scheduling Module and Calendar Scheduling

  As a REDCap end user I want to see that Calendar and Scheduling Module works as expected

   Scenario: The system shall support the ability to schedule events
    Given I login to REDCap with the user "Test_User1"
    When I create a new project named "D.114.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val/D114100.xml", and clicking the "Create Project" button
    # Then I should see a button labeled "Disable" in the "Scheduling module (longitudinal only)" row in the "Enable optional modules and customizations" section
    And I click on the button labeled "Define My Events"
    Then I should see "Event 1" in the define events table
    
    Then I click on the Edit image for the event named "Event 2"
    And I enter "1" into the Min Offset Range for the event named "Event 2" in the Event table
    And I enter "2" into the Max Offset Range for the event named "Event 2" in the Event table
    And I click on the button labeled "Save"
    Then I should see "Event 2" in the define events table

    Then I click on the Edit image for the event named "Event Three"
    And I enter "1" into the Min Offset Range for the event named "Event Three" in the Event table
    And I enter "2" into the Max Offset Range for the event named "Event Three" in the Event table
    And I enter "[complete_study_date]" into the Custom Event Label for the event named "Event Three" in the Event table
    And I click on the button labeled "Save"

    Then I should see a table header and rows containing the following values in the define events table:
      | Event # | Days Offset | Offset Range | Event Label | Custom Event Label    | Unique event name (auto generated) [event-name] |
      | 1       | 1           | -0/+0        | Event 1     |                       | event_1_arm_1                                   |
      | 2       | 2           | -1/+2        | Event 2     |                       | event_2_arm_1                                   |
      | 3       | 3           | -1/+2        | Event Three | [complete_study_date] | event_three_arm_1                               |

    # Upload Instrument-Event mappings
    Given I click on the tab labeled "Designate Instruments for My Events"
    When I click on the button labeled "Upload or download instrument mappings"
    And I click on the link labeled "Upload instrument-event mappings (CSV)"
    And I upload a "csv" format file located at "import_files/redcap_val/D114100_InstrumentDesignations.csv", by clicking the button near "Select your CSV File of Instrument-Event Designations" to browse for the file, and clicking the button labeled "Upload" to upload the file
    Then I should see a dialog containing the following text: "Upload instrument-event mappings (CSV)"
    And I click on the button labeled "Upload" in the dialog box
    Then I should see a dialog containing the following text: "SUCCESS!"
    And I click on the button labeled "Close" in the dialog box
    Then I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 1"
    And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1"
    And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 2"
    And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event Three"

    # Download Instrument-Event mappings
    When I click on the button labeled "Upload or download instrument mappings"
    And I click on the link labeled "Download instrument-event mappings (CSV)"
    Then I should see the latest downloaded "csv" file containing the headings and rows below
        | arm_num | unique_event_name | form            |
        | 1       | event_1_arm_1     | text_validation |
        | 1       | event_1_arm_1     | data_types      |
        | 1       | event_2_arm_1     | data_types      |
        | 1       | event_three_arm_1 | text_validation |           
            
    Given I click on the link labeled "Scheduling"
    And I clear field and enter "11/20/2023" into the input field labeled "Start Date:"
    And I click on the link labeled exactly "20"
    And I click on the button labeled "Generate Schedule"
    Then I should see 'Projected Schedule for "1"'
    When I click on the button labeled "Create Schedule"
    Then I should see 'Successfully Scheduled "1"'
    And I should see a table header and rows containing the following values in a table:
      | Date                 | Event Name  |
      | 11/21/2023 Tuesday   | Event 1     |
      | 11/22/2023 Wednesday | Event 2     |
      | 11/23/2023 Thursday  | Event Three |

    And I click on the tab "View or Edit Schedule"
    And I select "1" on the dropdown field labeled "Select a previously scheduled Record ID:"
    Then I should see 'View/Edit Existing Schedule'
    And I should see a table header and rows containing the following values in a table:
      | Date / Day of Week                                  | Event Name  |
      | 11/21/2023 Tuesday                                  | Event 1     |
      | 11/22/2023 Wednesday Range: 11/21/2023 - 11/24/2023 | Event 2     |
      | 11/23/2023 Thursday Range: 11/22/2023 - 11/25/2023  | Event Three |

    When I click on the Edit image for the event named "Event 2"
    And I enter "10:00" into the Time for the event named "Event 2" in the Schedule table
    And I click on the button labeled "Done"
    Then I enter "11/23/2023" into the Date for the event named "Event 2" in the Schedule table
    And I click on the link labeled exactly "23"
    Then I enter "Notes Event 2" into the Notes for the event named "Event 2" in the Schedule table
    And I click on the button labeled "Save"
    When I click on the button labeled "YES, adjust ALL dates" in the dialog box
    Then I should see a table header and rows containing the following values in a table:
      | Date / Day of Week                                  | Event Name  |
      | 11/21/2023 Tuesday                                  | Event 1     |
      | 11/23/2023 Thursday Range: 11/21/2023 - 11/24/2023  | Event 2     |
      | 11/24/2023 Friday Range: 11/22/2023 - 11/25/2023    | Event Three |
    
    When I clear field and enter "11/27/2023" into the input field labeled "Add new Ad Hoc calendar event on"
    And I click on the link labeled exactly "27"
    And I click on the button labeled "Add" to add an Ad Hoc Event
    And I enter "9:00" into the data entry form field labeled "Time:"
    And I enter "Ad Hoc Notes" into the input field labeled "Notes:"
    And I click on the button labeled "Add Calendar Event"
    And I click on the delete icon for the event name "Ad Hoc"
    When I click on the button labeled "Ok"
    Then I should see "The calendar event has been deleted"
    # PLEASE READ below!!! Applies to a lot
    # before and after this has many steps that occur in a new window, we will need many new steps
    
    Given I click on the view calendar event icon for the event name "Enrollment"
    When I click on the link labeled "View Schedule"
    And I should see "Scheduling"

    Given I click on the view calendar event icon for the event name "Baseline"
    When I click on the link labeled "View Record Home Page"
    Then I should see "Record Home Page"
    
    Given I click on the link labeled "Scheduling"
    And I click on the tab "View or Edit Schedule"
    And I select the dropdown option "2" for the Data Collection Instrument field labeled "Select a previously scheduled Study ID:"
    And I click on the link labeled "change status"
    And I select the dropdown option "Confirmed" for the Data Collection Instrument field labeled "Status"
    And I click on the button labeled "Save Status"
    And I close the window
    When I click on the view calendar event icon for the event name "Enrollment"
    Then I click on the bubble for "Demographics" in the Data Entry Forms section
    # new steps above 
    And I should see "Demographics"
    
    Given I click on the link labeled "Scheduling"
    And I click on the tab "View or Edit Schedule"
    And I select the dropdown option "2" for the Data Collection Instrument field labeled "Select a previously scheduled Study ID:"
    When I click on the link labeled "Print Schedule"
    Then I close the window

    Given I click on the link labeled "Calendar"
    And I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    When I select the dropdown option "2023" from the Year dropdown
    Then I should see a table header and rows containing the following values in a table:
      | Day         | Time    | Description                  |                                     
      | Mon Nov 20	| 1:30pm  |	[tick_small] 1 (Enrollment)  |

    Given I click on the tab labeled "Week"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    When I select the dropdown option "2023" from the Year dropdown
    #below table needs updating with symbols unfortunately. also change the times
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                         | Tuesday                        | Wednesday                     | Thursday  | Friday    | Saturday  |                                    
      | + New 	19| [tick_small] + New 	20 1:30pm  1 (Enrollment)  |	+ New 	21 3:00pm 1 (Baseline) | + New 	22 2:00pm 1 (Visit 1)  | + New 	23 | + New 	24 | + New 	25 | 
 
    Given I click on the tab labeled "Month"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    When I select the dropdown option "2023" from the Year dropdown
    Then I should see a table header and rows containing the following values in a table:
      | Sunday    | Monday                                            | Tuesday                         | Wednesday                          | Thursday  | Friday    | Saturday  |
      |           |                                                   |                                 | + New 	1                          | + New 	2  | + New 	3  | + New 	4  |
      | + New 	5 | + New 	6                                         | + New 	7                       | + New 	8                          | + New 	9  | + New 	10 | + New  11 |
      | + New  12 | + New 	13                                        | + New 	14                      | + New 	15                         | + New 	16 | + New 	17 | + New  18 |
      | + New  19 | + New 	20  [tick_small] 1:30pm 1 (Enrollment)    |	+ New 	21 3:00pm 1 (Baseline)  | + New 	22 2:00pm 1 (Visit 1)      | + New 	23 | + New 	24 | + New 	25 |
      | + New  26 | + New 	27                                        | + New 	28                      | + New 	29                         | + New 	30 |           |           | 

    Given I click on the tab labeled "Agenda"
    And I select the dropdown option "November" from the Month dropdown
    When I select the dropdown option "2023" from the Year dropdown
    Then I should see a table header and rows containing the following values in a table:
      | Day         | Time    | Description                  |                                     
      | Mon Nov 20	| 1:30pm  | [tick_small]	1 (Enrollment) |
      | Tue Nov 21	| 3:00pm  |	1 (Baseline)                 |
      | Wed Nov 22	| 2:00pm  |	1 (Visit 1)                  |
 
    Given I click on the tab labeled "Day"
    And I select the dropdown option "November" from the Month dropdown
    And I select the dropdown option "20" from the Day dropdown
    And I select the dropdown option "2023" from the Year dropdown
    And I click on the link labeled "1 (Enrollment)"
    When I click on the link labeled "View Schedule"
    Then I should see 'Then I should see "Record Home Page"'
    

    # i have reached step 20 in the word document. the start of it.