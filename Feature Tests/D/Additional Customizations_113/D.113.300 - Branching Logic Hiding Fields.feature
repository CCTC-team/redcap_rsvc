
Feature: D.113.300 - The system shall support the ability to prevent branching logic from hiding fields that have values 

    As a REDCap end user
    I want to see that 'prevent branching logic from hiding fields that have values' is working as expected
    
    Scenario: D.113.300 - Prevent branching logic from hiding fields that have values
        Given I login to REDCap with the user "Test_Admin" 
        And I create a new project named "D.113.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

        #ACTION: Enable 'Prevent branching logic from hiding fields that have values' 
        Given I click on the link labeled "Project Setup"
        And I click on the button labeled "Additional customizations"
        And I check the checkbox labeled "Prevent branching logic from hiding fields that have values"
        Then I click on the button labeled "Save"
        Then I should see "Sucess! Your changes have been saved!"

        #ACTION: Add branching logic
        When I click on the link labeled "Designer"
        And I click on the instrument labeled "Text Validation"
        And I click on the Branching Logic icon for the variable "Email"
        And I click on "" in the textarea field labeled "Advanced Branching Logic Syntax" in the dialog box
        And I enter "[ptname_v2_v2]=''" in the textarea field labeled "Logic Editor" in the dialog box
        And I click on the button labeled "Update & Close Editor" in the dialog box
        And I click on the button labeled "Save" in the dialog box
        Then I should see "Branching logic:[ptname_v2_v2]=''" within the field with variable name "email_v2"

        #ACTION: Enter data and verify
        Given I click on the link labeled "Record Status Dashboard"
        And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
        Then I should see a field labeled "Email"
        And I enter "John" into the data entry form field labeled "Name"
        Then I should NOT see a field labeled "Email"
        And I clear the field labeled "Name"
        Then I should see a field labeled "Email"
        And I enter "John@email.com" into the data entry form field labeled "Email"
        And I enter "John" into the data entry form field labeled "Name"
        Then I should see an icon titled "Field should be hidden by branching logic but is shown because it has a value" for the field labled "Email"
        And I click on the button labeled "Save & Stay"
  
        #VERIFY_LOG
        Given I click on the link labeled "Logging"
        Then I should see a table header and row containing the following values in the logging table:
            | Date / Time      | Username   | Action        | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Make project customizations             |
      
        And I logout
