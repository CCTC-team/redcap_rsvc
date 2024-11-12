Feature: D.102.300 - The system shall support the ability to send emails If conditional logic is TRUE when a record is saved on a specific form/survey

    As a REDCap end user
    I want to see that Alerts and Notifications is functioning as expected

    Scenario: D.102.300 Send emails If conditional logic is TRUE when a record is saved on a specific form/survey.
        Given I login to REDCap with the user "Test_user1"   
        And I create a new project named "D.102.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
        Given I click on the link labeled "Designer"
        And I click on the instrument labeled "Data Types"
        And I click on the Edit image for the field named "Text Box"
        And I click on the input element labeled "Action Tags / Field Annotation (optional)"
        And I enter "@CALCTEXT(if([ptname] != '', 'Pass', 'Fail'))" into the textarea field labeled "Logic Editor" 
        And I click on the button labeled "Update & Close Editor"
        And I click on the button labeled "Save"

        When I click on the link labeled "Alerts & Notifications"
        Then I should NOT see "Alert #1:Email Alert"
        And I click on the button labeled "Add New Alert"
        And I enter "Email Alert" into the input field labeled "Title of this alert"
        And I select the radio option "If conditional logic is TRUE when a record is saved on a specific form/survey*" for the field labeled "How will this alert be triggered?"
        And I select "“Data Types (Event 1 (Arm 1: Arm 1))" on the dropdown field labeled for alert form name
        And I should see the dropdown field for alert form status with the option "is saved with any form status" selected
        And I click on the input element labeled "while the following logic is true:"
        And I enter "[textbox]='Pass'" into the textarea field labeled "Logic Editor"
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
        And I should see "If the following logic is TRUE when the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has any form status: [textbox]='Pass'"
            
        Given I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        Then I should see "NEW Record ID 2"
        When  I click on the bubble for the "Text Validation" data collection instrument for event "Event 1" 
        And I enter "test_user4@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 2 successfully added"
        When  I click on the bubble for the "Data Types" data collection instrument for event "Event 1" 
        Then I should see "Fail" in the data entry form field "Text Box"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 2 successfully edited"

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        Then I should NOT see a link labeled "Testing Alerts and Notifications"

        Given I return to REDCap
        And I click on the link labeled "Alerts & Notifications"
        When I click on the tab labeled "Notification Log"
        And I should see "No notifications to list"
        And I click on the button labeled "View past notifications"
        And I should see "No notifications to list"

        Given I click on the link labeled "Record Status Dashboard"
        And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "2" and click on the bubble
        Then I should see "Fail" in the data entry form field "Text Box"
        And I enter "User4" into the input field labeled "Name"
        And I should see "Pass" in the data entry form field "Text Box"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 2 successfully edited"

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Testing Alerts and Notifications"
        Then I should see "From	Test_User1@test.edu"
        And I should see "To test_user4@example.com"
        And I should see "Alerts and Notifications"

        Given I return to REDCap
        Given I click on the link labeled "Alerts & Notifications"
        When I click on the tab labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        Then I should see a table header and rows containing the following values in the a table:
            | Notification send time | Alert    | View Notification | Record                          | Recipient              | Subject                          | 
            | mm/dd/yyyy hh:mm       | #1 (A-1) | [email icon]      | 2 (#1) - Event 1 (Arm 1: Arm 1) | test_user4@example.com | Testing Alerts and Notifications |