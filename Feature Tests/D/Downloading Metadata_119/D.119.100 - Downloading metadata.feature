
Feature: D.119.100 Downloading Metadata - The system shall support the ability to download metadata only (XML)

  As a REDCap end user
  I want to see that downloading metadata only feature is functioning as expected

    Scenario: D.119.100 - Downloading Metadata only(XML) consisting Text Validation(Record ID,Name, Email, Form status) and Data Types(Name, Text2, Textbox, Notes Box, Calculated Field, Multiple choice dropdown Auto, Multiple choice dropdown Manual, Radio Button Manual, Checkbox, Signature (add signature), File Upload (file_upload), Section break, Descriptive Text with File,Identifier,Identifier, Edit Field, Section break, Descriptive Text, Form Status) as instruments shown in Online Designer. User roles, Data Access Group and Data Quality to be included in XML.

    #SETUP
    Given I login to REDCap with the user "Test_Admin"   
    And I create a new project named "D.119.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
  
    #FUNCTIONAL_REQUIREMENT
    #ACTION: Import (with records in rows and column)
    Given I click on the link labeled "Data Import Tool"
    When I click on the button labeled "Choose File"
    And  I upload a "csv" format file located at "https://github.com/CCTC-team/redcap_cypress/tree/redcap_val/cypress/fixtures/redcap_val_fixtures/import_files", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    And I click on the button labeled "Upload File"
    Then I should see "Error Display table and Data Display table"
    And I click on the button labeled "Import Data"
    Then I should see " Import Successful! 2 records were created or modified during the import."

    #VERIFY_RSD: 2 records and instruments
    When I click on the link labeled "Record Status Dashboard"
    And I should see a table header and rows containing the following values in a table: 
    | Record ID |
    | 1         |
    | 2         |      
    And I should see the "Complete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "1"
    And I should see the "Incomplete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "1"
    And I should see the "Complete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "2"
    And I should see the "Incomplete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "2"
    
    #ACTION: Download Metadata only xml file for project D.119.100
    Given I click on the link labeled "Project Setup"
    Then I click on the link labeled "Other Functionality"
    And I click on the button labeled "Download metadata only(XML)"
    #VERIFY: The entire project (instruments, arms, fields, data quality rules, data access groups, user roles and project attributes) can be downloaded as a single XML file (CDISC ODM format).
    # The XML file can be found in the downloads of the user's system in format of 'D119100_yyyy-mm-dd_HH:MM.REDCap.xml'.

    #FUNCTIONAL_REQUIREMENT
    #ACTION: Create new Project using Metadata downloaded file and verify metadata is correct in this new project
    Given I click on the link labeled "My Projects"
    And I create a new project named "D.119.100_Metadata_only" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "D119100_yyyy-mm-dd_HH:MM.REDCap.xml", and clicking the "Create Project" button
    
    #VERIFY: Project settings in Project Setup page
    When I click on the link labeled "Project setup"
    And I should see the button labeled "Enable" in the "Use surveys in this project?" row in the "Main project settings" section
    And I should see the button labeled "Disable" in the "Use longitudinal data collection with defined events?" row in the "Main project settings" section
    And I should see the button labeled "Enable" in the "Use the MyCap participant-facing mobile app?" row in the "Main project settings" section
    
    #VERIFY: Text Validation and Data Types Instrument using Online Designer button in Project Setup
    When I click on the button labeled "Online Designer" 
    Then I should see a table header and rows containing the following values in a table:

      | Instrument name          |  Fields |
      | Text Validation          | 3       |
      | Data Types               | 18      |

    #VERIFY: Events and Arms using the section Define your events and designate instruments in Project Setup page  
    When I click on the link labeled "Project setup"
    And I click on the button labeled "Define My Events"
    Then I see "Arm 1"
    And I should see a table header and rows containing the following values in the define events table:
      | Event # | Event Label | Custom Event Label (optional)| Unique event name (auto generated) [event-name] |
      | 1       | Event 1     |                              |      event_1_arm_1                              |
      | 2       | Event 2     |                              |      event_2_arm_1                              |
      | 3       | Event Three |                              |      event_three_arm_1                          |

    Then I click on the input element labeled "Arm 2" 
    And I should see a table header and rows containing the following values in the define events table:
      | Event # | Event Label | Custom Event Label (optional)| Unique event name (auto generated) [event-name] |
      | 1       | Event 1     |                              |      event_1_arm_2                              |
     
    Then I click on the button labeled "Designate Instruments for My Events"
    And I see "Arm 1"
    And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 1"  
    And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1" 
    Then I click on the input element labeled "Arm 2" 
    And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1" 

    #VERIFY: Enable optional modules and customizations options on Project Setup page
    Given I click on the link labeled "Project Setup"
    Then I see the button labeled "Modify" in the "Repeating instruments and events" row in the "Enable optional modules and customizations" section
    And I should see the button labeled "Disable" in the "Auto-numbering for records" row in the "Enable optional modules and customizations" section
    And I should see the button labeled "Enable" in the "Scheduling module (longitudinal only)" row in the "Enable optional modules and customizations" section 
    And I should see the button labeled "Enable" in the "Randomization module" row in the "Enable optional modules and customizations" section
    And I should see the button labeled "Enable" in the "Designate an email field for communications (including survey invitations and alerts)" row in the "Enable optional modules and customizations" section 
    And I should see the button labeled "Enable" in the "Twilio SMS and Voice Call services for surveys and alerts" row in the "Enable optional modules and customizations" section
    And I should see the button labeled "Enable" in the "SendGrid Template email services for Alerts & Notifications" row in the "Enable optional modules and customizations" section
    
    #VERIFY: Additional customizations options on Project Setup page
    When I click on the link labeled "Additional customizations"
    And I should see a checkbox labeled "Enable the Field Comment Log or Data Resolution Workflow (Data Queries)?" that is checked
    And I should see a checkbox labeled "Enable:" that is checked
    And I should see a checkbox labeled "Allow users to edit or delete Field Comments (excludes Data Resolution Workflow comments)?" that is checked
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    And I should see a checkbox labeled "Display the Today/Now button for all date and time fields on forms/surveys?" that is checked
    And I click on the button labeled "Cancel" in the dialog box

    #VERIFY: Data Quality rules verfication in new project 
    When I click on the link labeled "Data Quality"
    Then I should see "Data Quality Rules"
    And I should see a table header and rows containing the following values in a table: 
    |  Rule #   |                   Rule Name                         | Rule Logic (Show discrepancy  only if...)                         |        
    |      A    | Blank values*                                       |  -                                                                |  
    |      B    | Blank values* (required fields only)                |  -                                                                |  
    |      C    | Field validation errors (incorrect data type)       |  -                                                                |  
    |      D    | Field validation errors (out of range)              |  -                                                                |  
    |      E    | Outliers for numerical fields (numbers, integers, sliders, calc fields)**|  -                                           |  
    |      F    | Hidden fields that contain values***                |  -                                                                |  
    |      G    | Multiple choice fields with invalid values          |  -                                                                |  
    |      H    | Incorrect values for calculated fields              |  -                                                                |  
    |      I    | Fields containing "missing data codes"              |  -                                                                |  
    |      1    | Identifier more than 8                              |  [identifier] > 8			                                            |  

    #VERIFY: User Role with permissions verification in new project
    When I click on the link labeled "User Rights"
    And I should see a table header and rows containing the following values in a table:
    |  Role Name      | Username               | Expiration |  Data Access Group  |  Project Design and Setup  | User Rights | Data Access Groups | Data Viewing Rights            | Data Exports Rights          | Alerts and Notifications | Reports & Report Builder |Stats and Charts | Calendar | Data Import Tool | Data Comparison Tool | Logging | File Repository | Record Locking Customization | Lock/Unlock Records | Data Quality (create/edit rules) | Data Quality (execute rules) | API   | REDCap Mobile App | Create Records | Rename Records | Delete Records | User Role ID | Unique Role Name |
    |      -          | test_admin (Test User) |    never   |       -             |        Ticked              |    Ticked   |       Ticked       |  2 View & Edit                 | 2 Full Data Set              |        Ticked            |      Ticked              |      Ticked     |   Ticked |        Ticked    |  Ticked              |  Ticked |      Ticked     |       Cross                  |      Cross          |        Ticked                    |    Ticked                    | Cross |      Ticked       |      Ticked    |     Cross      |      Cross     |     -        |          -       |
    |   Test Role     | [no users assigned     |            |                     |        Ticked              |    Ticked   |       Ticked       |  1 Read Only 1 View and Edit   | 1 No Access 1 Full Data Set  |       Cross              |      Ticked              |      Ticked     |   Ticked |      Cross       |     Cross            |  Cross  |      Ticked     |       Cross                  |      Cross          |        Cross                     |    Cross                     | Cross |      Cross        |      Ticked    |     Cross      |     Cross      |     12       |    U-1714W3W7CD  |

    #VERIFY: DAGS in new project
    When I click on the link labeled "DAGs"
    Then I should see a table header and rows containing the following values in data access groups table:
    | Data Access Groups        | Users in group                                    | Number of records in group| Unique Group Name (auto generated)| 
    | DAGS1                     |                                                   |          0                | dag1                              |   
    | [Not assigned to a group  | test_admin (Test User) * Can view all records     |          2                |                                   |               
    
    #VERIFY: Codebook in new project
    When I click on the link labeled "Codebook"
    Then I should see a table header and rows containing the following values in the codebook table:  
            | #  | Variable / Field Name                        | Field Label                                               | Field Attributes (Field Type, Validation, Choices, Calculations, etc.) | 
            |    | Instrument: Text Validation (text_validation)|                                                           |                                                                        |   
            | 1  | [record_id]                                  | Record ID                                                 | text                                                                   |  
            | 2  | [ptname_v2_v2]                               | Name                                                      | text                                                                   |  
            | 3  | [email_v2]                                   | Email                                                     | text (email)                                                           |  
            | 4  | [text_validation_complete]                   | Section Header: Form Status Complete?                     | dropdown                                                               | 
            | 4  | [text_validation_complete]                   | Section Header: Form Status Complete?                     | 0 Incomplete                                                           | 
            | 4  | [text_validation_complete]                   | Section Header: Form Status Complete?                     | 1 Unverified                                                           | 
            | 4  | [text_validation_complete]                   | Section Header: Form Status Complete?                     | 2 Complete                                                             |  
            |    | Instrument: Data Types (data_types)          |                                                           |                                                                        | 
            | 5  | [ptname]                                     | Name                                                      | text                                                                   | 
            | 6  | [text2]                                      | text2                                                     | text                                                                   |   
            | 7  | [textbox]                                    | Text Box                                                  | text                                                                   |   
            | 8  | [notesbox]                                   | Notes box                                                 | notes                                                                  | 
            | 9  | [calculated_field]                           | Calculated Field                                          | calc Calculation: 3*2                                                  |
            | 10 | [multiple_dropdown_auto]                     | Multiple Choice Dropdown Auto                             | dropdown                                                               |
            | 10 | [multiple_dropdown_auto]                     | Multiple Choice Dropdown Auto                             | 1 DDChoice1                                                            |
            | 10 | [multiple_dropdown_auto]                     | Multiple Choice Dropdown Auto                             | 1 DDChoice2                                                            |
            | 10 | [multiple_dropdown_auto]                     | Multiple Choice Dropdown Auto                             | 1 DDChoice3                                                            |
            | 11 | [multiple_dropdown_manual]                   | Multiple Choice Dropdown Manual                           | dropdown                                                               |
            | 11 | [multiple_dropdown_manual]                   | Multiple Choice Dropdown Manual                           | 5 DDChoice5                                                            |
            | 11 | [multiple_dropdown_manual]                   | Multiple Choice Dropdown Manual                           | 7 DDChoice6                                                            |
            | 11 | [multiple_dropdown_manual]                   | Multiple Choice Dropdown Manual                           | 6 DDChoice7                                                            |
            | 12 | [radio_button_auto]                          | Radio Button Auto                                         | radio                                                                  |
            | 12 | [radio_button_auto]                          | Radio Button Auto                                         | 1 Choice1                                                              |
            | 12 | [radio_button_auto]                          | Radio Button Auto                                         | 2 Choice2                                                              |
            | 12 | [radio_button_auto]                          | Radio Button Auto                                         | 3 Choice3                                                              |
            | 13 | [radio_button_manual]                        | Radio Button Manual                                       | radio                                                                  | 
            | 13 | [radio_button_manual]                        | Radio Button Manual                                       | 9..9 Choice99                                                          | 
            | 13 | [radio_button_manual]                        | Radio Button Manual                                       | 100 Choice100                                                          | 
            | 13 | [radio_button_manual]                        | Radio Button Manual                                       | 101 Choice101                                                          | 
            | 14 | [checkbox]                                   | Checkbox                                                  | checkbox                                                               |
            | 14 | [checkbox]                                   | Checkbox                                                  | 1 checkbox___1 Checkbox                                                |
            | 14 | [checkbox]                                   | Checkbox                                                  | 2 checkbox___2 Checkbox2                                               |
            | 14 | [checkbox]                                   | Checkbox                                                  | 3 checkbox___3 Checkbox3                                               |
            | 15 | [signature]                                  | Signature                                                 | file (signature)                                                       |                                            
            | 16 | [file_upload]                                | File Upload                                               | file                                                                   |
            | 17 | [descriptive_file_text]                      | Section Header: Section Break Descriptive Text with File  | descriptive                                                            |
            | 18 | [required]                                   | Required                                                  | text                                                                   |                                                  
            | 19 | [identifier]                                 | Identifier                                                | text, Identifier                                                       |
            | 20 | [identifier_2]                               | Identifier                                                | text, Identifier                                                       |
            | 21 | [edit_field]                                 | Edit Field                                                | text                                                                   |
            | 22 | [descriptive_text]                           | Section Header: Section Break Descriptive Text            | descriptive                                                            |
            | 23 | [data_types_complete]                        | Section Header: Form Status Complete?                     | dropdown                                                               | 
            | 23 | [data_types_complete]                        | Section Header: Form Status Complete?                     | 0 Incomplete                                                           | 
            | 23 | [data_types_complete]                        | Section Header: Form Status Complete?                     | 1 Unverified                                                           | 
            | 23 | [data_types_complete]                        | Section Header: Form Status Complete?                     | 2 Complete                                                             |   
    And I logout