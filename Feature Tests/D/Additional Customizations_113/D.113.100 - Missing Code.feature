Feature: D.113.100 - The system shall support the ability to add Missing Data Codes to fields. 

      As a REDCap end user
      I want to see that Missing Data Code is functioning as expected 

      Scenario: D.113.100 - Missing Data Code
            Given I login to REDCap with the user "Test_Admin" 
            And I create a new project named "D.113.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

            Given I click on the link labeled "Record Status Dashboard"
            And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
            Then I should NOT see Missing Code icon

            #ACTION: Add Missing Data Code
            Given I click on the link labeled "Project Setup"
            And I click on the button labeled "Additional customizations"
            # Verify Missing Data Code is empty
            Then I should see "" in the data entry form field "Missing Data Codes" 
            And I click on the button labeled "Add" for the row labeled "INV" 
            And I click on the button labeled "Add" for the row labeled "UNK" 
            Then I should see "INV, Invalid UNK, Unknown" in the data entry form field "Missing Data Codes" 
            Then I click on the button labeled "Save"
            Then I should see "Sucess! Your changes have been saved!"

            #ACTION: Mark field as Missing
            Given I click on the link labeled "Record Status Dashboard"
            And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
            And I click on the Missing Code icon for the field labeled "Name"
            And I click on the button labeled "Unknown (UNK)"
            Then I should see the field labeled "Name" with missing code "Unknown (UNK)"
            And I click on the Missing Code icon for the field labeled "Email"
            And I click on the button labeled "Invalid (INV)"
            Then I should see the field labeled "Email" with missing code "Invalid (INV)"
            And I click on the button labeled "Save & Exit Form"

            #ACTION: Verify Missing Data Code in report
            Given I click on the link labeled "Data Exports, Reports, and Stats"
            Then I should see "All data (all records and fields)"
            When I click on the button labeled "View Report" for the report named "All data (all records and fields)"
            Then I should see a table header and row containing the following values in a table:
                  | Record ID | Event Name             | Name          | Email         |
                  | 1         | Event 1 (Arm 1: Arm 1) | Unknown (UNK) | Invalid (INV) |

            #ACTION: Verify Missing Data Code in CSV Download
            Given I click on the button labeled "Export Data"
            And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
            And I click on the button labeled "Export Data"
            Then I should see a dialog containing the following text: "Data export was successful!"
            And I click on the download icon to receive the file for the "CSV / Microsoft Excel (raw data)" format in the dialog box
            Then the downloaded CSV with filename "D113100_DATA_yyyy-mm-dd_hhmm" should have a value "UNK" for column "ptname_v2_v2" 
            And the downloaded CSV with filename "D113100_DATA_yyyy-mm-dd_hhmm" should have a value "INV" for column "email_v2" 
            And I click on the button labeled "Close" in the dialog box

            #VERIFY_LOG
            Given I click on the link labeled "Logging"
            Then I should see a table header and row containing the following values in the logging table:
                  | Date / Time      | Username   | Action                                   | List of Data Changes OR Fields Exported |
                  | mm/dd/yyyy hh:mm | test_admin | Update record 1 (Event 1 (Arm 1: Arm 1)) | ptname_v2_v2 = 'UNK', email_v2 = 'INV'  |
                  | mm/dd/yyyy hh:mm | test_admin | Manage/Design                            | Make project customizations             |
      
            And I logout