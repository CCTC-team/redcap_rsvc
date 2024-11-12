
Feature: D.102.400 - The system shall support the ability to send emails When conditional logic is TRUE during a data import, data entry, or as the result of time-based logic

  As a REDCap end user
  I want to see that Alerts and Notifications is functioning as expected

  Scenario: D.102.400 Send emails When conditional logic is TRUE during a data import, data entry, or as the result of time-based logic.
    Given I login to REDCap with the user "Test_user1"   
    And I create a new project named "D.102.400" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
      
    When I click on the link labeled "Alerts & Notifications"
    Then I should NOT see "Alert #1:Email Alert"
    And I click on the button labeled "Add New Alert"
    And I enter "Email Alert" into the input field labeled "Title of this alert"
    And I select the radio option "When conditional logic is TRUE during a data import, data entry, or as the result of time-based logic" for the field labeled "How will this alert be triggered?"
    And I click on the input element labeled "while the following logic is true:"
    And I enter "[ptname_v2_v2] != ''" into the textarea field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor" in the dialog box
    And I check the checkbox labeled "Ensure logic is still true before sending notification?"
    And I should see the radio field labeled "When to send the alert?" with the option "Send immediately" selected 
    And I should see the radio field labeled "Send it how many times?" with the option "Just once" selected  
    And I should see the radio field labeled "Alert Type:" with the option "Email" selected
    And I select "[event_1_arm_1][email_v2] “Email(Event 1 (Arm 1: Arm 1))" on the dropdown field labeled "Email To"
    And I enter "Testing Alerts and Notifications" into the input field labeled "Subject"
    And I enter "Alerts and Notifications" into the input field labeled "Message"
    When I click on the button labeled "Save" in the dialog box
    Then I should see "Success! New alert created"
    And I should see "Alert #1:Email Alert"
    And I should see "When the following logic becomes TRUE during data import or data entry: [ptname_v2_v2] != ''"
          
    ##VERIFY: MailHog 
    Given I open Email
    And I delete all the messages

    ##ACTION: Import (with records in rows and column)
    Given I return to REDCap
    And I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "redcap_val/D.102.400_DataImport.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"
    Then I should see "Import Successful! 2 records were created or modified during the import"

    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "2" and click on the bubble
    Then I should see "" in the data entry form field "Name"
    And I should see "test_user1@abc.com" in the data entry form field "Email"
    And I click on the button labeled "Cancel"
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "3" and click on the bubble
    Then I should see "User2" in the data entry form field "Name"
    And I should see "test_user2@abc.com" in the data entry form field "Email"
    And I click on the button labeled "Cancel"

    ##VERIFY: Sent email in MailHog 
    Given I open Email
    Then I should see a message "Testing Alerts and Notifications" for user "test_user2@abc.com"
    And I should NOT see a message "Testing Alerts and Notifications" for user "test_user1@abc.com"

    Given I return to REDCap
    Given I click on the link labeled "Alerts & Notifications"
    When I click on the tab labeled "Notification Log"
    And I click on the button labeled "View past notifications"
    Then I should see a table header and rows containing the following values in the a table:
        | Notification send time | Alert    | View Notification | Record                          | Recipient              | Subject                          | 
        | mm/dd/yyyy hh:mm       | #1 (A-1) | [email icon]      | 3 (#1) - Event 1 (Arm 1: Arm 1) | test_user2@example.com | Testing Alerts and Notifications |
