
Feature: D.107.100  Action Tags

  As a REDCap end user
  I want to see that Action Tags is functioning as expected

  Scenario: D.107.100.3 - @CALCDATE
    Given I login to REDCap with the user "test_user1"
    And I create a new project named "D.107.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_ActionTags.xml", and clicking the "Create Project" button
    And I click on the button labeled "Additional Customizations"
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    When I click on the button labeled "Save"
    Then I should see "Success! Your changes have been saved."

    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "Next Visit Due"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@CALCDATE([visit], 7, 'd')" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@CALCDATE([visit], 7, 'd')" into the input field labeled "Field Note"
    And I click on the button labeled "Save"
    And I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    And I should see "" in the data entry form field "Visit Date"
    When I enter "02/09/2023" into the input field labeled "Visit Date"
    Then I should see "@CALCDATE(02-09-2023, 7, 'd')"
    And I should see "09-09-2023" in the data entry form field "Next Visit Due" 
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

  Scenario: D.107.100.1 - @CALCTEXT
    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "Years Old"
    And I click on the input element labeled "Calculation Equation"
    And I enter "datediff([dob], 'today', 'y')" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    Then I click on the button labeled "Save"
    And I click on the Edit image for the field named "This is a CALCTEXT that will output the words you if they are greater than 10 or your child if less than 10. You could use this in piping to other fields."
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@CALCTEXT(if([years] >= 10, 'you', 'your child'))" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@CALCTEXT(if([years] >= 10, 'you', 'your child'))" into the input field labeled "Field Note"
    And I click on the button labeled "Save"
    And I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    Then I should see "" in the data entry form field "Participant Date of Birth"
    And I should see "" in the data entry form field "Years old"
    And I should see "your child" in the data entry form field "This is a CALCTEXT that will output the words you if they are greater than 10 or your child if less than 10. You could use this in piping to other fields."
    When I enter "19-11-1978" into the input field labeled "Participant Date of Birth"
    Then I should see "you" in the data entry form field "This is a CALCTEXT that will output the words you if they are greater than 10 or your child if less than 10. You could use this in piping to other fields." 
    When I enter "TODAY" into the input field labeled "Participant Date of Birth"
    Then I should see "0" in the data entry form field "Years old" 
    And I should see "your child" in the data entry form field "This is a CALCTEXT that will output the words you if they are greater than 10 or your child if less than 10. You could use this in piping to other fields." 
    And I click on the link labeled "View equation"
    And I should see "Calculation:	@CALCTEXT(if([years] >= 10, 'you', 'your child'))"
    And I click on the button labeled "Close"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    
  Scenario: D.107.100.2 - @DEFAULT
    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "Favorite Disney Character"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@DEFAULT='5'" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@DEFAULT='5'" into the input field labeled "Field Note"
    Then I click on the button labeled "Save"
    And I click on the Edit image for the field named "What sport do you like the most"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter '@DEFAULT="Gymnastics"' into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter '@DEFAULT="Gymnastics"' into the input field labeled "Field Note"
    Then I click on the button labeled "Save"
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    Then I should see the radio labeled "Favorite Disney Character" with option "Goofy" selected
    And I should see "Gymnastics" in the data entry form field "What sport do you like the most"
    And I clear field and enter "Football" into the input field labeled "What sport do you like the most" 
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

  Scenario: D.107.100.4 - @NOW and @TODAY
    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "Now"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@NOW" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@NOW" into the input field labeled "Field Note"
    Then I click on the button labeled "Save"
    And I click on the Edit image for the field named "Today"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@TODAY" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@TODAY" into the input field labeled "Field Note"
    Then I click on the button labeled "Save"

    Given I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    And I should see "@NOW"
    Then I should see the exact time in the field labeled "Now"
    And I should see "@TODAY"
    Then I should see today's date in the field labeled "Today" 
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

  Scenario: D.107.100.6 - @USERNAME
    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "@Username"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@USERNAME" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@USERNAME" into the input field labeled "Field Note"
    Then I click on the button labeled "Save"

    Given I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    When I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    Then I should see "test_user1" in the data entry form field "@Username"
    And I should see "@USERNAME"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

  Scenario: D.107.100.5 - @IF
    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "What are your preferred appointment times?"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@IF([weekend_yn] = '0', @HIDECHOICE='6', '')" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    Then I click on the button labeled "Save"

    Given I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    And I select the radio option "Yes" for the field labeled "Are you able to attend weekend appointments?" 
    When I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see the radio field labeled "What are you preferred appointment times?" with the options below
    | Monday 8am - 9am     |
    | Tuesday 10am - 11am  |
    | Wednesday 12pm - 1pm |
    | Thursday 2pm - 3pm   |
    | Friday 4pm - 5pm     |
    | Saturday 10am - 11am |
    And I select the radio option "No" for the field labeled "Are you able to attend weekend appointments?" 
    When I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see the radio field labeled "What are you preferred appointment times?" with the options below
    | Monday 8am - 9am     |
    | Tuesday 10am - 11am  |
    | Wednesday 12pm - 1pm |
    | Thursday 2pm - 3pm   |
    | Friday 4pm - 5pm     |
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    And I logout
