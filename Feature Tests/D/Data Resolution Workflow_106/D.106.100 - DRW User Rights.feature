Feature: D.106.100 Data Resolution Workflow

  As a REDCap end user
  I want to see that I have the ability to allow Data Resolution Workflow rights to be (No Access, View only, Open queries only, Respond only to opened queries, Open and respond to queries; Open, close, and respond to queries).


  Scenario: D.106.100 Verify above mentioned Data Resolution Workflow rights 

      #ACTION: Data Resolution Workflow SETUP
      Given I login to REDCap with the user "Test_Admin" 
      And I create a new project named "D.106.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val_fixtures/cdisc_files/Project_redcap_val.xml", and clicking the "Create Project" button

      #ACTION: Enable the Data Resolution Workflow (Data Queries)
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      And I select "Data Resolution Workflow" on the dropdown field labeled "Enable:"
      Then I click on the button labeled "Save"
      Then I should see "The Data Resolution Workflow has now been enabled!"
      And I click on the button labeled "Close" in the dialog box

      #ACTION: Import data 
      Given I click on the link labeled "Data Import Tool"
      And  I upload a "csv" format file located at "redcap_val_fixtures/import_files/D.106.100_Data_Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
      And I should see "Your document was uploaded successfully and is ready for review."
      And I click on the button labeled "Import Data"
      Then I should see "Import Successful! 15 records were created or modified during the import."

      #ACTION: Add users 
      Given I click on the link labeled "User Rights"
      And I click on the button labeled "Upload or download users, roles, and assignments"
      And I click on the link labeled "Upload users (CSV)"
      And I upload a "csv" format file located at "redcap_val_fixtures/import_files/D.106.100_Users.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
      And I should see "Upload users (CSV) - Confirm"
      And I click on the button labeled "Upload" in the dialog box
      And I should see "5 users were added or updated"
      And I click on the button labeled "Close" in the dialog box

      #ACTION: Add field values
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
      And I enter "Some text" into the input field labeled "Text2"
      And I click on the button labeled "Save & Exit Form" 

      #ACTION: Open a query
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Text Box"
      And I click on the radio labeled "Open query" in the dialog box
      And I enter "Query 1" into the input field labeled "Comment:" 
      And I click on the button labeled "Open query"
      Then I should see a red exclamation icon for the input field labeled "Text Box"
      And I click on the Comment icon for the field labeled "Notes Box"
      And I click on the radio labeled "Verified data value"
      And I click on the button labeled "Verified data value"
      Then I should see a green tick icon for the input field labeled "Notes Box"
      And I logout

      #ACTION: Verify access right - 'Open close and respond to queries', 'verify/de-verify'
      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Text Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                   | 
            | mm/dd/yyyy hh:mm | test_admin | Action: Opened query Comment:"Query 1" |
      Then I should see "Reply with response"
      Then I should see "Close the query"
      And I should NOT see "Verified data value"
      And I click on the button labeled "Cancel" in the dialog box
      And I click on the Comment icon for the field labeled "Text2"
      Then I should see "Verified data value"
      And I should see "Open query"
      And I click on the button labeled "Cancel" in the dialog box
      And I click on the Comment icon for the field labeled "Notes Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details       | 
            | mm/dd/yyyy hh:mm | test_admin | Action:Verified data value |
      Then I should see "De-verify data value"
      And I click on the button labeled "Cancel" in the dialog box
      And I logout

      #ACTION: Verify access right - 'Respond only to open queries', No access to 'verify/de-verify'
      Given I login to REDCap with the user "Test_User2" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Text Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                   | 
            | mm/dd/yyyy hh:mm | test_admin | Action: Opened query Comment:"Query 1" |
      Then I should see "Reply with response"
      Then I should NOT see "Close the query"
      And I click on the button labeled "Cancel" in the dialog box
      Given I click on the Comment icon for the field labeled "Name"
      Then I should NOT see "Open query"
      And I should NOT see "Verified data value"
      And I should see "Awaiting action by user with sufficient user privileges"
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I click on the button labeled "Close" in the dialog box
      And I click on the Comment icon for the field labeled "Notes Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details       | 
            | mm/dd/yyyy hh:mm | test_admin | Action:Verified data value |
      And I should see "Awaiting action by user with sufficient user privileges"
      Then I should NOT see "De-verify data value"
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I click on the button labeled "Close" in the dialog box
      And I logout

      #ACTION: Verify User right - 'Open queries only', 'verify/de-verify'
      Given I login to REDCap with the user "Test_User3" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Text Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                   | 
            | mm/dd/yyyy hh:mm | test_admin | Action: Opened query Comment:"Query 1" |
      Then I should NOT see "Close the query"
      And I should NOT see "Respond to query"
      And I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I click on the Comment icon for the field labeled "Name"
      Then I should see "Open query"
      And I should see "Verified data value"
      And I click on the button labeled "Cancel" in the dialog box
      And I click on the Comment icon for the field labeled "Notes Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details       | 
            | mm/dd/yyyy hh:mm | test_admin | Action:Verified data value |
      Then I should see "De-verify data value"
      And I click on the button labeled "Cancel" in the dialog box
      And I logout

      #ACTION: Verify User right - 'Open and respond to queries', 'verify/de-verify'
      Given I login to REDCap with the user "Test_User4" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Text Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                   | 
            | mm/dd/yyyy hh:mm | test_admin | Action: Opened query Comment:"Query 1" |
      Then I should NOT see "Close the query"
      And I should see "Reply with response:"
      And I click on the button labeled "Cancel" in the dialog box
      And I click on the Comment icon for the field labeled "Name"
      Then I should see "Open query"
      And I should see "Verified data value"
      And I click on the button labeled "Cancel" in the dialog box
      And I click on the Comment icon for the field labeled "Notes Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details       | 
            | mm/dd/yyyy hh:mm | test_admin | Action:Verified data value |
      Then I should see "De-verify data value"
      And I click on the button labeled "Cancel" in the dialog box
      And I logout


      #ACTION: Assign user rights
      Given I login to REDCap with the user "Test_Admin" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      When I click on the link labeled "User Rights"
      And I click on the link labeled "test_user3"
      And I click on the button labeled "Edit user privileges"
      And I select the User Right named "Data Resolution Workflow" and choose "No Access"
      And I click on the button labeled "Save Changes"
      Then I should see "User test_user3 successfully edited"
      And I click on the link labeled "test_user4"
      And I click on the button labeled "Edit user privileges"
      And I select the User Right named "Data Resolution Workflow" and choose "View only"
      And I click on the button labeled "Save Changes"
      Then I should see "User test_user4 successfully edited"
      And I logout

      #ACTION: Verify access right - 'No Access', No access to 'verify/de-verify'
      Given I login to REDCap with the user "Test_User3" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      And I click on the link labeled "Record Status Dashboard"
      And  I click on the bubble for the "Data Types" data collection instrument for record ID "1"
      Then I should NOT see "Data Resolution Workflow" icon for the field labeled "Text Box"
      And I should NOT see "Data Resolution Workflow" icon for the field labeled "Name" 
      And I should NOT see "Data Resolution Workflow" icon for the field labeled "Notes Box" 
      And I logout

      #ACTION: Verify access right - 'View only', No access to 'verify/de-verify'
      Given I login to REDCap with the user "Test_User4" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.100"
      And I click on the link labeled "Record Status Dashboard"
      And  I click on the bubble for the "Data Types" data collection instrument for record ID "1"
      #The below step shows a new query cannot be opened and cannot verify data value
      Then I should NOT see "Data Resolution Workflow" icon for the field labeled "Name"
      Given I click on the Comment icon for the field labeled "Text Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                   | 
            | mm/dd/yyyy hh:mm | test_admin | Action: Opened query Comment:"Query 1" |
      Then I should NOT see "Close the query"
      Then I should NOT see "Respond to query"
      And I should see "Awaiting action by user with sufficient user privileges"
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I click on the button labeled "Close" in the dialog box
      Given I click on the Comment icon for the field labeled "Notes Box"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details       | 
            | mm/dd/yyyy hh:mm | test_admin | Action:Verified data value |
      And I should see "Awaiting action by user with sufficient user privileges"
      Then I should NOT see "De-verify data value"
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I click on the button labeled "Close" in the dialog box
      And I logout