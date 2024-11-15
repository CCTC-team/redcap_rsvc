Feature: D.106.200 Data Resolution Workflow

  As a REDCap end user
  I want to see that I have the ability to open, close, reopen and respond to queries.
  I want to see that I have the ability to filter issues based on records, fields, events and users.
  I want to see that I have the ability to upload files to queries. 
  I want to see that I have the ability to email and send messages via REDCap messenger with a link to issues.

  Scenario: D.106.200 Open, close, reopen and respond to queries
      #ACTION: Data Resolution Workflow SETUP
      Given I login to REDCap with the user "Test_User1" 
      And I create a new project named "D.106.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val_fixtures/cdisc_files/Project_redcap_val.xml", and clicking the "Create Project" button

      #Enable the Data Resolution Workflow (Data Queries)
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      And I select "Data Resolution Workflow" in the dropdown field labeled "Enable:"
      Then I click on the button labeled "Save"
      Then I should see "The Data Resolution Workflow has now been enabled!"
      And I click on the button labeled "Close" in the dialog box

      #ACTION: Import data
      Given I click on the link labeled "Data Import Tool"
      And I upload a "csv" format file located at "redcap_val_fixtures/import_files/D.106.100_Data_Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
      And I should see "Your document was uploaded successfully and is ready for review."
      And I click on the button labeled "Import Data"
      Then I should see "Import Successful! 15 records were created or modified during the import."

      #ACTION: Add users 
      When I click on the link labeled "User Rights"
      And I enter "Test_User2" into the input field labeled "Add with custom rights"
      And I click on the button labeled "Add with custom rights"
      Then I should see a dialog containing the following text: "Adding new user"
      And I select the User Right named "Data Resolution Workflow" and choose "Open, close, and respond to queries"
      And I click on the button labeled "Add user" in the dialog box
      Then I should see a table header and rows containing the following values in a table:
      | Role name | Username                |
      | —         | test_user1 (Test User1) |
      | —         | test_user2 (Test User2) |

      And I click on the link labeled "test_user1"
      And I click on the button labeled "Edit user privileges"
      And I select the User Right named "Data Resolution Workflow" and choose "Open, close, and respond to queries"
      And I click on the button labeled "Save Changes"
      Then I should see "User test_user1 successfully edited"

      #ACTION: Open a new query and 'Assign Query' and notify via Email and Messenger
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      Given I click on the Comment icon for the field labeled "Email"
      Given I click on the radio labeled "Open query" in the dialog box
      And I select "test_user2 (Test_User2)" on the dropdown field labeled "Assign query to a user (optional): "
      And I select the checkbox option "Email" for the field labeled "Notify this user of their assignment using:" 
      And I select the checkbox option "REDCap Messenger" for the field labeled "Notify this user of their assignment using:"
      And I enter "Query 1" into the input field labeled "Comment:" 
      And I click on the button labeled "Open query"
      Then I should see a "red" exclamation icon for the input field labeled "Email"
      And I logout

      #VERIFY D.106.500 - Email
      Given I open Email
      Then I should see a message "[REDCap] You were assigned to a data query" for user "Test_User2"
      And I click on the message "[REDCap] You were assigned to a data query" for user "Test_User2"
      Then I should see 'You have been assigned to a data query that was just opened in the REDCap project "D.106.200"' 

      #ACTION: Verify notification on Messenger and respond to query by uploading a file
      Given I login to REDCap with the user "Test_User2" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      #VERIFY D.106.500 - REDCap Messenger
      And I click on the link labeled "REDCap Messenger"
      Then I should see "Assigned to a data query" 
      And I click on the link labeled "Assigned to a data query" 
      Then I should see a dialog containing the following text: 'You have been assigned to a data query that was just opened in the REDCap project "D.106.200"' 
      And I click on the link labeled "DataQuality/resolve"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                   | 
            | mm/dd/yyyy hh:mm | Test_User1 | Action: Opened query Assigned to user:Test_User2 (Test User2) Comment:"Query 1" |

      #VERIFY D.106.400 - Upload file to Query
      And I select "Verified - Confirmed correct (no error)" on the dropdown field labeled "Reply with response:"
      Then I click on the link labeled "Upload file"
      Then I upload a "csv" format file located at "/import_files/B.3.16.600_DataImport.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload document" to upload the file
      Then I should see "Document was successfully uploaded!"
      And I click on the button labeled "Close" in the dialog box
      And I enter "The value is correct - B.3.16.600_DataImport.csv uploaded" into the input field labeled "Comment:" 
      And I click on the button labeled "Respond to query"
      Then I should see "Data Resolution Dashboard"
      When I click on the button labeled "2 comments"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                                                                                                                                   | 
            | mm/dd/yyyy hh:mm | test_user2 | Response:Verified - Confirmed correct (no error) Uploaded file:B.3.16.600_DataImport.... (0.01 MB) Comment:“The value is correct - B.3.16.600_DataImport.csv uploaded” |

      And  I download a file by clicking on the link labeled "B.3.16.600_DataImport.... (0.01 MB)" 
      Then I should have a "csv" file that contains the headings below
            | record_id | redcap_survey_identifier | data_types_timestamp | ptname | textbox | radio | notesbox | identifier | identifier_2 | date_ymd | datetime_ymd_hmss | data_types_complete |

      And I click on the radio labeled "Send back for further attention" in the dialog box
      And I enter "Please clarify" into the input field labeled "Comment:" 
      And  I click on the button labeled "Send back for further attention"
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      Then I should see a "red" exclamation icon for the input field labeled "Email"
      And I logout

      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Email"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                            | 
            | mm/dd/yyyy hh:mm | test_user4 | Action:Sent back for further attention Comment:“Please clarify” |

      And I click on the radio labeled "Close the query" in the dialog box
      And I enter "Closed" into the input field labeled "Comment:" 
      And I click on the button labeled "Close the query"
      Then I should see a "green" exclamation icon for the input field labeled "Email"
      Given I click on the Comment icon for the field labeled "Email"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                 | 
            | mm/dd/yyyy hh:mm | test_user4 | Action:Closed query Comment:“Closed” |

      When I check the checkbox labeled "Reopen the closed query" 
      And I enter "Reopen the closed query" into the input field labeled "Comment:"
      And I click on the button labeled "Reopen query"
      Then I should see a "red" exclamation icon for the input field labeled "Email"
      Given I click on the Comment icon for the field labeled "Email"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                    | 
            | mm/dd/yyyy hh:mm | test_user4 | Action:Reopened query Comment:“Reopen the closed query” |

      And I click on the radio labeled "Close the query" in the dialog box
      And I enter "Closed" into the input field labeled "Comment:" 
      And I click on the button labeled "Close the query"
      Then I should see a "green" exclamation icon for the input field labeled "Email"
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Data Types" data collection instrument for record ID "2" 
      And I click on the Comment icon for the field labeled "Name"
      When I click on the radio labeled "Open query" in the dialog box
      And I select "test_user1 (Test_User1)" on the dropdown field labeled "Assign query to a user (optional): "
      And I enter "Query 2" into the input field labeled "Comment:" 
      And I click on the button labeled "Open query"
      Then I should see a "red" exclamation icon for the input field labeled "Name"
     
      ##VERIFY_LOG
      Given I click on the link labeled "Logging"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | Username   | Action        | List of Data Changes OR Fields Exported                                                                                                                 |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Open data query (Record: 2, Event: Event 1 (Arm 1: Arm 1), Field: ptname, Comment: "Query 2")                                                           |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Close data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Closed")                                                         |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Reopen the closed query")                                         |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Close data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Closed")                                                         |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Send data query back for further attention (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Please clarify")                       |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Download uploaded document for data query response (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2)                                          |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Respond to data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "The value is correct - B.3.16.600_DataImport.csv uploaded") |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Upload document for data query response (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2)                                                     |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Query 1")                                                         |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Make project customizations                                                                                                                             |
      
      #D.106.300 - Filtering
      When I click on the link labeled "Resolve Issues"
      When I select the option "All status types(2)" from the dropdown field Status of Data Resolution Dashboard 
      Then I should see a table header and row containing the following values in a table:
            | Record                        | Data Quality rule and/or Field  | User Assigned  | First Update                             | Last Update                             |
            | 1 Event 1 (Arm 1: Arm 1)      | email_v2 (Email)                | Test_User2     | Test_User1 (mm/dd/yyyy hh:mm): "Query 1" | Test_User1 (mm/dd/yyyy hh:mm): "Closed" |
            | 2 (#1) Event 1 (Arm 1: Arm 1) | ptname (Name)                   | Test_User1     | Test_User2 (mm/dd/yyyy hh:mm): "Query 2" | [same as first update]                  |
      
      And I download a file by clicking on the link labeled "Export" 
      Then the downloaded CSV with filename "D.106.200_DataResolutionDashboard_yyyy-mm-dd.csv" has the header and rows below
          | Current Query Status | Number of comments | Record | Data Access Group | Event                  | Data Quality Rule | Field            | User Assigned | Days Open | First Update                             | Last Update                             | Time Raised      | Time Resolved    |
          | CLOSED               | 6                  | 1      |                   | Event 1 (Arm 1: Arm 1) |                   | email_v2 (Email) | Test_User2    | 0         | Test_User1 (mm/dd/yyyy hh:mm): "Query 1" | Test_User1 (mm/dd/yyyy hh:mm): "Closed" | mm/dd/yyyy hh:mm | mm/dd/yyyy hh:mm |
          | OPEN                 | 1                  | 2 (#1) |                   | Event 1 (Arm 1: Arm 1) |                   | ptname (Name)    | Test_User1    | 0         | Test_User1 (mm/dd/yyyy hh:mm): "Query 2" | [same as first update]                  | mm/dd/yyyy hh:mm |                  |
      
      When I select the option "Open / unresolved issues (1)" from the dropdown field Status of Data Resolution Dashboard 
      Then I should see a table header and row containing the following values in a table:
            | Record                        | Data Quality rule and/or Field  | User Assigned  | First Update                             | Last Update            |
            | 2 (#1) Event 1 (Arm 1: Arm 1) | ptname (Name)                   | Test_User1     | Test_User2 (mm/dd/yyyy hh:mm): "Query 2" | [same as first update] |

      When I select the option "All status types(2)" from the dropdown field Status of Data Resolution Dashboard 
      And I select the option "email_v2(1)" from the dropdown field Field_Rule of Data Resolution Dashboard 
      Then I should see a table header and row containing the following values in a table:
            | Record                        | Data Quality rule and/or Field  | User Assigned  | First Update                             | Last Update                             |
            | 1 Event 1 (Arm 1: Arm 1)      | email_v2 (Email)                | Test_User2     | Test_User1 (mm/dd/yyyy hh:mm): "Query 1" | Test_User1 (mm/dd/yyyy hh:mm): "Closed" |

      When I select the option "Event 1 (Arm 1: Arm 1)" from the dropdown field Event of Data Resolution Dashboard 
      Then I should see a table header and row containing the following values in a table:
            | Record                        | Data Quality rule and/or Field  | User Assigned  | First Update                             | Last Update                             |
            | 1 Event 1 (Arm 1: Arm 1)      | email_v2 (Email)                | Test_User2     | Test_User1 (mm/dd/yyyy hh:mm): "Query 1" | Test_User1 (mm/dd/yyyy hh:mm): "Closed" |
      
      When I select the option "Test_User1 (Test_User1)" from the dropdown field User of Data Resolution Dashboard
      Then I should see "No results to display"

      When I select the option "All fields" from the dropdown field Field_Rule of Data Resolution Dashboard
            | Record                        | Data Quality rule and/or Field  | User Assigned  | First Update                             | Last Update                             |
            | 2 (#1) Event 1 (Arm 1: Arm 1) | ptname (Name)                   | Test_User1     | Test_User2 (mm/dd/yyyy hh:mm): "Query 2" | [same as first update]                  |
      
      And I logout