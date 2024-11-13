
Feature: D.113.400 - The system shall support the ability to specify a reason when making changes to existing records 

    As a REDCap end user 
    I want to see that Reason for change is working as expected 
   
   Scenario: D.113.400 - Reason for change 

        #ACTION: Specify a reason when making changes to existing records SETUP
        Given I login to REDCap with the user "Test_Admin" 
        And I create a new project named "D.113.400" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

        #ACTION: Enable reason when making changes to existing records 
        Given I click on the link labeled "Project Setup"
        And I click on the button labeled "Additional customizations"
        And I check the checkbox labeled "Require a 'reason' when making changes to existing records?"
        Then I click on the button labeled "Save"
        Then I should see "Sucess! Your changes have been saved!"

        #ACTION: Import data 
        Given I click on the link labeled "Data Import Tool"
        And  I upload a "csv" format file located at "redcap_val_fixtures/import_files/Redcap_val_Data Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        And I should see "Your document was uploaded successfully and is ready for review."
        And I should see "Please supply a reason for the data changes for EACH existing record in the text boxes."
        And I enter "Reason 1" into the textarea field labeled "Please supply a reason for the data changes for EACH existing record in the text boxes." for row "1"
        And I enter "Reason 2" into the textarea field labeled "Please supply a reason for the data changes for EACH existing record in the text boxes." for row "2"
        And I click on the  button labeled "Import Data"
        Then I should see "Import Successful! 15 records were created or modified during the import."

        #ACTION: Change field values
        Given I click on the link labeled "Record Status Dashboard"
        And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
        When I click on the History icon for the field labeled "Name"
        Then I should see a table header and row containing the following values in a table:
            | Date / Time of Change | User       | Data Changes Made | Reason for Data Change(s) | 
            | mm/dd/yyyy hh:mm      | test_admin | Lily Brown        | Reason 2                  |

        And I click on the button labeled "Close" in the dialog box
        And I click on the link labeled "Text Validation"
        When I click on the History icon for the field labeled "Name"
        # Bug - Should be Reason 1
        Then I should see a table header and row containing the following values in a table:
            | Date / Time of Change | User       | Data Changes Made | Reason for Data Change(s) | 
            | mm/dd/yyyy hh:mm      | test_admin | Tony Stone        | Reason 2                  |
        
        And I click on the button labeled "Close" in the dialog box
        When I clear field and enter "John" into the data entry form field labeled "Name"
        And I clear field and enter "John@email.com" into the data entry form field labeled "Email" 
        And I click on the button labeled "Save & Stay"
        Then I should see "Please supply reason for data changes" in the dialog box 
        And I enter "Test reason for changes" into the textarea field labeled "Reason for changes:" in the dialog box
        And I click on the button labeled "Save" in the dialog box

        #ACTION: Verify reason for change history
        When I click on the History icon for the field labeled "Name"
        Then I should see a table header and row containing the following values in a table:
            | Date / Time of Change | User       | Data Changes Made | Reason for Data Change(s) | 
            | mm/dd/yyyy hh:mm      | test_admin | Tony Stone        | Reason 2                  |
            | mm/dd/yyyy hh:mm      | test_admin |  John             | Test reason for changes   |
        
        And I click on the button labeled "Close"
        Given I click on the History icon for the field labeled "Email"
        Then I should see a table header and row containing the following values in a table:
            | Date / Time of Change | User       | Data Changes Made     | Reason for Data Change(s) | 
            | mm/dd/yyyy hh:mm      | test_admin | tonystone@example.com | Reason 2                  |
            | mm/dd/yyyy hh:mm      | test_admin | John@email.com        | Test reason for changes   |
        
        And I click on the button labeled "Close"

        #VERIFY_LOG
        Given I click on the link labeled "Logging"
        Then I should see a table header and row containing the following values in the logging table:
            | Date / Time      | Username   | Action        | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Make project customizations             |
      
        And I logout
