
Feature: D.102.100 - The system shall support the ability to send emails when a record is saved on a specific form/survey

    As a REDCap end user
    I want to see that Alerts and Notifications is functioning as expected

    Scenario: D.102.100 - Send alert when a record is saved on a specific form/survey
        #SETUP
        Given I login to REDCap with the user "Test_user1"   
        And I create a new project named "D.102.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

        #FUNCTIONAL_REQUIREMENT
        ##ACTION: New Alert
        When I click on the link labeled "Alerts & Notifications"
        And I click on the button labeled "Add New Alert"
        And I enter "Email Alert" into the input field labeled "Title of this alert"
        And I should see the radio field labeled "How will this alert be triggered?" with the option "When a record is saved on a specific form/survey*" selected 
        And I select "Data Types (Event 1 (Arm 1: Arm 1))" on the dropdown field for alert form name
        And I should see the dropdown field for alert form status with the option "is saved with any form status" selected 
        And I should see the radio field labeled "When to send the alert?" with the option "Send immediately" selected 
        And I should see the radio field labeled "Send it how many times?" with the option "Just once" selected  
        And I should see the radio field labeled "Alert Type:" with the option "Email" selected
        And I select "[event_1_arm_1][email_v2] “Email(Event 1 (Arm 1: Arm 1))" on the dropdown field labeled "Email To"
        And I enter "Testing Alerts and Notifications" into the input field labeled "Subject"
        And I enter "Alerts and Notifications" into the input field labeled "Message"
        When I click on the button labeled "Save" in the dialog box
        Then I should see "Success! New alert created"
        And I should see "Alert #1:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has any form status."

        Given I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And  I click on the bubble for the "Text Validation" data collection instrument for event "Event 1" 
        And I enter "test_user2@example.com" into the data entry form field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        Then I should see "Record ID 2 successfully added."
        And  I click on the bubble for the "Data Types" data collection instrument for event "Event 1" 
        And I enter "Lily Brown" into the data entry form field labeled "Name"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 2 successfully edited."

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Testing Alerts and Notifications"
        Then I should see "From	Test_User1@test.edu"
        And I should see "To test_user2@example.com"
        And I should see "Alerts and Notifications"

        Given I return to REDCap
        And I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        Then I should see a table header and rows containing the following values in the a table:
            | Notification send time | Alert    | View Notification | Record                          | Recipient              | Subject                          | 
            | mm/dd/yyyy hh:mm       | #1 (A-1) | [email icon]      | 2 (#1) - Event 1 (Arm 1: Arm 1) | test_user2@example.com | Testing Alerts and Notifications |

        Given I click on the mail icon for record "2"
        Then I should see "Test_User1@test.edu" in the dialog box
        And I should see "test_user2@example.com" in the dialog box
        And I should see "Testing Alerts and Notifications" in the dialog box
        And I should see "Alerts and Notifications" in the dialog box
        And I click on the button labeled "Close" in the dialog box

    Scenario: D.102.200 - Modify Alerts
        Given I click on the tab labeled "My Alerts"
        When I click on the link labeled "Edit" for alert "1"
        Then I should see "Edit Alert #1"
        And I select "is saved with Complete status only" on the dropdown field for alert form status
        And I clear field and enter "Editing Alerts and Notifications" into the input field labeled "Subject"
        And I click on the button labeled "Save" in the dialog box
        Then I should see "Success! The alert was updated"
        And I should see "Alert #1:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has a Complete status."

        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "Add new record for the arm selected above"
        And I should see "NEW Record ID 3"
        And  I click on the bubble for the "Text Validation" data collection instrument for event "Event 1" 
        And I enter "test_user3@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 3 successfully added"
        And  I click on the bubble for the "Data Types" data collection instrument for event "Event 1" 
        And I enter "Thomas Stone" into the input field labeled "Name"
        And I click on the button labeled "Save & Exit Form" 
        Then I should see "Record ID 3 successfully edited" 

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        Then I should NOT see a link labeled "Editing Alerts and Notifications"

        Given I return to REDCap
        And I click on the link labeled "Alerts & Notifications"
        When I click on the tab labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should NOT see a link labeled "3"

        Given I click on the link labeled "Record Status Dashboard"
        And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "3" and click on the bubble
        And I select "Complete" on the dropdown field labeled "Complete?"  
        And I click on the button labeled "Save & Exit Form"
        Then I should see "Record ID 3 successfully edited" 

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the tab labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        Then I should see a table header and rows containing the following values in the a table:
            | Notification send time | Alert    | View Notification | Record                          | Recipient              | Subject                          | 
            | mm/dd/yyyy hh:mm       | #1 (A-1) | [email icon]      | 2 (#1) - Event 1 (Arm 1: Arm 1) | test_user2@example.com | Testing Alerts and Notifications |
            | mm/dd/yyyy hh:mm       | #1 (A-1) | [email icon]      | 3 (#1) - Event 1 (Arm 1: Arm 1) | test_user3@example.com | Editing Alerts and Notifications |

       ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Editing Alerts and Notifications"
        Then I should see "From	Test_User1@test.edu"
        And I should see "To test_user3@example.com"
        And I should see "Alerts and Notifications"
     
        ##ACTION: Copy alert
        Given I return to REDCap
        Given I click on the link labeled "Alerts & Notifications"
        Then I should NOT see "Alert #2:Email Alert"
        When I click on the link labeled "Options"
        And I click on the link labeled "Copy alert"
        Then I should see "Alert #2:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has a Complete status."
        When I click on the link labeled "Edit" for alert "2"
        Then I should see "Edit Alert #2"
        And I should see the radio field labeled "How will this alert be triggered?" with the option "When a record is saved on a specific form/survey*" selected 
        And I should see the dropdown field for alert form name with the option "Data Types (Event 1 (Arm 1: Arm 1))" selected 
        And I should see the dropdown field for alert form status with the option "is saved with Complete status only" selected
        And I should see the radio field labeled "When to send the alert?" with the option "Send immediately" selected 
        And I should see the radio field labeled "Send it how many times?" with the option "Just once" selected  
        And I should see the radio field labeled "Alert Type:" with the option "Email" selected
        And I should see the dropdown field labeled "Email To" with the option "[event_1_arm_1][email_v2] “Email(Event 1 (Arm 1: Arm 1))" selected 
        And I should see "Editing Alerts and Notifications" in the data entry form field "Subject"
        And I should see "Alerts and Notifications" in the data entry form field "Message"
        And I click on the button labeled "Cancel" in the dialog box
        Then I should see "Alert #2:Email Alert"

        ##ACTION: Deactivate alert
        When I click on the link labeled "Options" for alert "2"
        And I click on the link labeled "Deactivate alert"
        Then I should see "Are you sure you want to deactivate this Alert? It can be re-enabled later, if needed."
        When I click on the button labeled "Deactivate" in the dialog box
        Then I should see "Success! The alert was deactivated"
        And I should NOT see "Alert #2:Email Alert"
        When I check the checkbox labeled "Show deactivated alerts"
        Then I should see "Alert #2:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has a Complete status."
        And I should see "DEACTIVATED: Alert was deactivated"

        ##ACTION: Re-enable alert
        When I click on the link labeled "Options" for alert "2"
        And I click on the link labeled "Re-enable alert"
        Then I should see "Success! The alert was re-enabled."
        And I should see "No matching records found"
        When I uncheck the checkbox labeled "Show deactivated alerts"
        Then I should see "Alert #1:Email Alert"
        And I should see "Alert #2:Email Alert"

        ##ACTION: Move alert
        # Edit name for alert 2
        Given I click on the link labeled "Edit" for alert "2"
        Then I should see "Edit Alert #2"
        And I clear field and enter "Testing Move Alerts and Notifications" into the input field labeled "Subject"
        When I click on the button labeled "Save" in the dialog box
        Then I should see "Success! The alert was updated."
        # Move alert 1
        When I click on the link labeled "Options" for alert "1"
        And I click on the link labeled "Move alert"
        And I select "Alert #2: Email Alert (A-1)" on the dropdown field labeled "Move the alert above so that it will be located immediately *AFTER* the following alert:"
        And I click on the button labeled "Move alert" in the dialog box
        Then I should see "Alert #1: Email Alert (A-2): The alert was successfully moved to a new location!"
        Then I should see "PLEASE NOTE that moving this alert may have caused some or all of the alerts to be re-numbered automatically. They will still retain their same alert title and unique alert ID, but their alert number (#) may have changed because alert numbers are generated on the fly based on the order of the alerts."
        And I click on the button labeled "Close" in the dialog box
        # VERIFY
        When I click on the link labeled "Edit" for alert "1"
        Then I should see "Edit Alert #1"
        And I should see "Testing Move Alerts and Notifications" in the data entry form field "Subject"
        And I click on the button labeled "Cancel" in the dialog box
        When I click on the link labeled "Edit" for alert "2"
        Then I should see "Edit Alert #2"
        And I should see "Editing Alerts and Notifications" in the data entry form field "Subject"
        And I click on the button labeled "Cancel" in the dialog box

        ##ACTION: Permanently delete alert
        When I click on the link labeled "Options" for alert "1"
        And I click on the link labeled "Deactivate alert"
        And I should see "Are you sure you want to deactivate this Alert? It can be re-enabled later, if needed."
        When I click on the button labeled "Deactivate" in the dialog box
        And I should see "Success! The alert was deactivated"
        And I should NOT see "Alert #1:Email Alert"
        When I check the checkbox labeled "Show deactivated alerts"
        Then I should see "Alert #1:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has a Complete status."
        And I should see "DEACTIVATED: Alert was deactivated"
        When I click on the link labeled "Edit" for alert "1"
        Then I should see "Testing Move Alerts and Notifications" in the data entry form field "Subject"
        And I click on the button labeled "Cancel" in the dialog box
        When I click on the link labeled "Options" for alert "1"
        And I click on the link labeled "Permanently delete"
        Then I should see "Are you sure you want to delete this Alert?"
        And I should see "This will permanently delete the Alert."
        And I click on the button labeled "Delete" in the dialog box
        Then I should see "Success! The alert was permanently deleted."
        And I should see a checkbox labeled "Show deactivated alerts" that is unchecked
        And I should see "Alert #1:Email Alert"
        When I click on the link labeled "Edit" for alert "1"
        Then I should see "Editing Alerts and Notifications" in the data entry form field "Subject"
        And I click on the button labeled "Cancel" in the dialog box
        When I check the checkbox labeled "Show deactivated alerts"
        Then I should see "No matching records found"

        #VERIFY_LOG: Logging Table
        Given I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action                                       | List of Data Changes OR Fields Exported                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |  
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Permanently delete alert       | Alert #1:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                        
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Deactivate  alert              | Alert #1:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |                        
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Move alert                     | Alert #1: Email Alert (A-4)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                        
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Reactivate  alert              | Alert #2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                        
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Deactivate alert               | Alert #2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                        
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Copy alert                     | Alert #2 copied from Alert #1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |                        
            | MM/DD/YYYY HH:MM | test_user1 | Sent alert Record 3 (Event 1 (Arm 1: Arm 1)) | Alert #1, From: 'Test_User1@test.edu', To: 'test_user3@example.com', Subject: 'Editing Alerts and Notifications', Message: 'Alerts and Notification'                                                                                                                                                                                                                                                                                                                                                                                                                                   |                        
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Modify alert                   | Alert #1, alert_title = 'Email Alert', alert_type = 'EMAIL', alert_stop_type = 'RECORD', alert_expiration = '', form_name = 'data_types', form_name_event = 'event_1_arm_1', alert_condition = '', ensure_logic_still_true = 'no', prevent_piping_identifiers = 'yes', trigger_on_instrument_save_status = 'any_status', email_from = 'Test_User1@test.edu', email_from_display = '', email_to = '[event_1_arm_1][email_v2]', phone_number_to = '', email_cc = '', email_bcc = '', email_subject = 'Editing Alerts and Notifications', alert_message = 'Alerts and Notifications'         | 
            | MM/DD/YYYY HH:MM | test_user1 | Sent alert Record 2 (Event 1 (Arm 1: Arm 1)) | Alert #1, From: 'Test_User1@test.edu', To: 'test_user2@example.com', Subject: 'Testing Alerts and Notifications', Message: 'Alerts and Notification'                                                                                                                                                                                                                                                                                                                                                                                                                                      | 
            | MM/DD/YYYY HH:MM | test_user1 | Manage/Design Create alert                   | Alert #1, alert_title = 'Email Alert', alert_type = 'EMAIL', alert_stop_type = 'RECORD', alert_expiration = '', form_name = 'data_types', form_name_event = 'event_1_arm_1', alert_condition = '', ensure_logic_still_true = 'no', prevent_piping_identifiers = 'yes', trigger_on_instrument_save_status = 'complete_status_only', email_from = 'Test_User1@test.edu', email_from_display = '', email_to = '[event_1_arm_1][email_v2]', phone_number_to = '', email_cc = '', email_bcc = '', email_subject = 'Testing Alerts and Notifications', alert_message = 'Alert and Notification' | 

        And I logout
