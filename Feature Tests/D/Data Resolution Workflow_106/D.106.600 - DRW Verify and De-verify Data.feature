Feature: D.106.600 Data Resolution Workflow

  As a REDCap end user
  I want to see that I have the ability to verify and de-verify data value based on user rights
  I want to see that I have the ability to automatically de-verify data that has been verified and subsequently changed 

  Scenario: D.106.600 - Verify and de-verify data
      Given I login to REDCap with the user "Test_User1" 
      And I create a new project named "D.106.600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val_fixtures/cdisc_files/Project_redcap_val.xml", and clicking the "Create Project" button

      #ACTION: Enable the Data Resolution Workflow (Data Queries)
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      And I select "Data Resolution Workflow" in the dropdown field labeled "Enable:"
      Then I click on the button labeled "Save"
      Then I should see "The Data Resolution Workflow has now been enabled!"
      And I click on the button labeled "Close" in the dialog box

      #ACTION: Import data
      And I click on the link labeled "Data Import Tool"
      And  I upload a "csv" format file located at "redcap_val_fixtures/import_files/D.106.100_Data_Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
      And I should see "Your document was uploaded successfully and is ready for review."
      And I click on the button labeled "Import Data"
      Then I should see "Import Successful! 15 records were created or modified during the import."

      #ACTION: Edit User rights to verify/de-verify data
      Given I click on the link labeled "User Rights"
      And I click on the link labeled "test_user1"
      And I click on the button labeled "Edit user privileges"
      And I select the User Right named "Data Resolution Workflow" and choose "Open, close, and respond to queries"
      And I click on the button labeled "Save Changes"
      Then I should see "User test_user1 successfully edited"

      #ACTION: Verify and de-verify data
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                           | 
            | mm/dd/yyyy hh:mm | test_user1 | Data Changes Made: ptname_v2_v2 = 'Tony Stone' |

      Given I click on the radio labeled "Verified data value"
      And I enter "Test Verify Data" into the input field labeled "Comment (optional):"
      And I click on the button labeled "Verified data value" 
      Then I should see a green tick icon for the input field labeled "Name"
      
      Given I click on the link labeled "Resolve Issues"
      And I select the "All status types(1)" option from the Filters dropdown field indentified by 'choose_status_type'
      Then I should see a table header and row containing the following values in a table:
            | Record                   | Data Quality rule and/or Field | First Update                                      | Last Update            |
            | 1 Event 1 (Arm 1: Arm 1) | Field: ptname_v2_v2 (Name)     | Test_User1 (mm/dd/yyyy hh:mm): "Test Verify Data" | [same as first update] |

      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                   | 
            | mm/dd/yyyy hh:mm | test_user1 | Data Changes Made: ptname_v2_v2 = 'Tony Stone'         |
            | mm/dd/yyyy hh:mm | Test_User1 | Action: Verified data value Comment "Test Verify Data" |
      
      Given I click on the radio labeled "De-verify data value"
      And I click on the button labeled "De-verify data value"
      Then I should see a dialog containing the following text: "A comment is required. Please enter a comment." 
      And I click on the button labeled "Close" in the dialog box
      And I enter "Test De-verify Data" into the input field labeled "Comment:"
      And I click on the button labeled "De-verify data value"
      Then I should see a red exclamation icon for the input field labeled "Name"
      When I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                         | 
            | mm/dd/yyyy hh:mm | test_user1 | Data Changes Made: ptname_v2_v2 = 'Tony Stone'               |
            | mm/dd/yyyy hh:mm | Test_User1 | Action: Verified data value Comment "Test Verify Data"       |
            | mm/dd/yyyy hh:mm | Test_User1 | Action: De-verified data value Comment "Test De-verify Data" |
      
      And I click on the button labeled "Cancel" in the dialog box

      Given I click on the link labeled "Resolve Issues"
      And I select the "All status types(1)" option from the Filters dropdown field indentified by 'choose_status_type'
      Then I should see a table header and row containing the following values in a table:
            | Record                   | Data Quality rule and/or Field  | First Update                                      | Last Update                                          |
            | 1 Event 1 (Arm 1: Arm 1) | Field: ptname_v2_v2 (Name)      | Test_User1 (mm/dd/yyyy hh:mm): "Test Verify Data" | Test_User1 (mm/dd/yyyy hh:mm): "Test De-verify Data" |
      
  Scenario: D.106.700 - Automatically De-verify data when verified data is changed
      And I click on the link labeled "Record Status Dashboard"
      And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Name"
      Then I should see "Data De-verified"
      Given I select the radio labeled "Verified data value" in the dialog box
      And I click on the button labeled "Verified data value" 
      Then I should see a green tick icon for the input field labeled "Name"
      Given I clear field and enter "John" into the input field labeled "Name" 
      And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
      And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      Then I should see a red exclamation icon for the input field labeled "Name"
      And I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                           | 
            | mm/dd/yyyy hh:mm | test_user1 | Data Changes Made: ptname_v2_v2 = 'John'                       |
            | mm/dd/yyyy hh:mm | Test_User1 | Action: De-verified data value (automatically via data change) |

      And I click on the button labeled "Cancel" in the dialog box

      ##VERIFY_LOG
      When I click on the link labeled "logging"
      Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                                   | List of Data Changes OR Fields Exported                                                                                |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                            | De-verified data value (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2)                                 |
      | mm/dd/yyyy hh:mm | test_user1 | Update record 1 (Event 1 (Arm 1: Arm 1)) | ptname_v2_v2 = 'John'                                                                                                  |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                            | Verified data value (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2)                                    |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                            | De-verified data value (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2, Comment: "Test De-verify Data") |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                            | Verified data value (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2, Comment: "Test Verify Data")       |