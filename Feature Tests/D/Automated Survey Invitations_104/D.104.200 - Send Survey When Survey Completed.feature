
Feature: D.104.200 - The system shall support the ability to send a survey when another survey is completed 

  As a REDCap end user
  I want to be able to send surveys upon completion of a previos survey

  Scenario: D.104.200 - Send Survey When Survey Completed
    
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.104.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Survey.REDCap.xml", and clicking the "Create Project" button
   
    Given I click on the link labeled "Project Setup"
    And I should see a button labeled "Disable" in the "Use surveys in this project?" row in the "Main project settings" section
    And I click on the button labeled "Enable" in the "Use surveys in this project?" row in the "Main project settings" section
    And I click on the button labeled "Enable" in the dialog box
    When I click on the button labeled "Enable" in the "Designate an email field for communications (including survey invitations and alerts)" row in the "Enable optional modules and customizations" section
    Then I select 'email "Email"' on the dropdown field labeled "Choose an email field to use for invitations to survey participants:"
    And I click on the last button labeled "Save"

    Given I click on the link labeled "Designer"
    And I click on the last button labeled "Enable"
    And I click on the button labeled "Save Changes"

    Given I click on the link labeled "Designer"
    And I click on the button labeled "Auto Invitation options"
    When I upload a "csv" format file located at "FILEPATH", by clicking the button near "Upload Automated Survey Invitations settings (CSV)" to browse for the file, and clicking the button labeled "CHECK" to upload the file
    # the above step needs the filepath and end button name ammending, same as above comment, i am in the office and did the rest of this at home. 
    Then I click on the button labeled "Close"

    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
    | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported                                                                  |
    | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Edit settings for automated survey invitations                                                           |
    
    Given I click on the link labeled "Designer"
    And I click on the button labeled "Auto Invitation options"
    When I click on the button labeled "Re-evaluate selected surveys"
    Then I should see "0 invitations were scheduled (and 2 already-scheduled invitations were unscheduled) across a total of 1 record"
    # unsure on the string in the step above now that things have been re-structured

    Given I wait for 5 minutes
    And I open email
    When I verify the email(s)
    And I should see "From: test_user@example.com"
    And I should see "To: joe@abc.com"
    And I should see "From: Testing Survey Event 1 "
    And I click on the link "Testing Survey Event 1"
    And I enter "1" into the input field labeled "Reminder"
    And I enter "description" into the input field labeled "Description"
    And I click on the button labeled "Submit"
    Then I click on the button labeled "Close survey"
  
    Given I return to redcap
    When I click on the link labeled "Record Status Dashboard"
    Then I should see the "Completed Survey Response" icon for the "Survey" longitudinal instrument on event "Event 1" for record "1"
    
    Given I wait for 10 minutes
    And I open email
    When I verify the email(s)
    Then I should see "From: test_user@example.com"
    And I should see "From: joe@abc.com"
    And I should see "From: Testing Survey Event 2"

    Given I return to redcap
    And I click on the link labeled "Survey Distribution Tools"
    And I click on the tab labeled "Survey Invitation Log"
    And I click on the "[link]" icon 
    #unsure how best to describe the above
    When I enter "3" into the input field labeled "Reminder"
    And I enter "description3" into the input field labeled "Description"
    And I click on the button labeled "Submit"
    Then I click on the button labeled "Close survey"

    Given I return to redcap
    When I click on the link labeled "Record Status Dashboard"
    Then I should see the "Completed Survey Response" icon for the "Survey" longitudinal instrument on event "Event 2" for record "1"

    Given I click on the link labeled "Designer"
    And I should see a table header and rows containing the following values in the administrators table:
    | Instrument name | Fields | View PDF  | Enabled as Survey   | Instrument actions | Survey related options                |
    | Demographics    | 4      | [pdficon] | Enable              | Choose action      |                                       |
    | Survey          | 2      | [pdficon] | [tick_shield_small] | Choose action      | Survey settings Automated Invitations |
    # will it work like this? can it read text in buttons? 
    And I click on the button labeled "Automated Invitations"
    And I should see "Click the buttons below to set up or modify automated survey invitations."
    And I should see "Event 1"
    And I should see "Event 2"
    And I click on the last button labeled "Modify"
    And I check the checkbox labeled "When the following logic becomes true:"
    And I clear field and enter "[event_1_arm_1][lname]!=''" in the textarea field labeled "Logic Editor" in the dialog box
    And I click on the button labeled "Update & Close Editor" in the dialog box
    And I check the checkbox labeled "Ensure logic is still true before sending invitation?"
    When I click on the button labeled "Save"
    Then I should see "Settings for automated invitations were successfully saved!"
    And I click on the button "Close" in the pop-up box

    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I click the bubble to select a record for the "Demographics" longitudinal instrument on event "Event 1"
    And I enter "Dave" into the input field labeled "First name"
    And I enter "dave@abc.com" into the input field labeled "Email"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I wait for 5 minutes
    And I open email
    When I verify the email(s)
    And I should see "From: test_user@example.com"
    And I should see "From: dave@abc.com"
    And I should see "From: Testing Survey Event 1"
    And I click on the link "Testing Survey Event 1"
    And I enter "45" into the input field labeled "Reminder"
    And I enter "description45" into the input field labeled "Description"
    And I click on the button labeled "Submit"
    Then I click on the button labeled "Close survey"

    Given I return to redcap
    And I click on the link labeled "Record Status Dashboard"
    And I should see the "Completed Survey Response" icon for the "Survey" longitudinal instrument on event "Event Three" for record "1"
    # need to use the above step in a few places? 
    And I locate the bubble for the "Demographics" instrument on event "Event 1" for record ID "2" and click on the bubble
    When I enter "Paul" into the input field labeled "Last name"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I wait for 10 minutes
    And I open email
    When I verify the email(s)
    And I should see "From: test_user@example.com"
    And I should see "To: dave@abc.com"
    And I should see "From: Testing Survey Event 2"
    And I click on the link "Testing Survey Event 2"
    And I enter "3" into the input field labeled "Reminder"
    And I enter "description3" into the input field labeled "Description"
    And I click on the button labeled "Submit"
    Then I click on the button labeled "Close survey"

    Given I return to redcap
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I click the bubble to select a record for the "Demographics" longitudinal instrument on event "Event 1"
    And I enter "James" into the input field labeled "Last name"
    And I enter "Joe" into the input field labeled "First name"
    And I enter "james@abc.com" into the input field labeled "Email"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I wait for 10 minutes
    And I open email
    When I verify the email(s)
    And I should see "From: test_user@example.com"
    And I should see "To: james@abc.com"
    And I should see "From: Testing Survey Event 1"
    And I click on the link "Testing Survey Event 1"
    And I enter "10" into the input field labeled "Reminder"
    And I enter "description10" into the input field labeled "Description"
    And I click on the button labeled "Submit"
    Then I click on the button labeled "Close survey"

    Given I return to redcap
    And I click on the link labeled "Survey Distribution Tools"
    When I click on the tab labeled "Survey Invitation Log"
    Then I should see "No invitations to list"