Feature: D.5.22.300 - The system shall support the ability to limit fields included in a report.

  As a REDCap end user
  I want to be able to filter Live records included in a report and order the results

  Scenario: D.5.22.300 - Filter Live Records and Order the Results 
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.5.22.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.REDCap.xml", and clicking the "Create Project" button

    Given I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "import_files/Redcap_Val_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter 'Test Report 1' into the input field labeled "Name of Report:" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 2" 
    And I select 'radio_button_manual "Radio Button Manual"' on the dropdown field labeled "First by"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Radio Button Manual | 
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice100 (100)     | 
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice100 (100)     | 
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice101 (101)     | 
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice99 (9..9)     | 
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice99 (9..9)     |
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter 'Test Report 2' into the input field labeled "Name of Report:" 
    And I enter 'required "Required"' into the input field labeled "Field 2" 
    And I select 'required "Required"' on the dropdown field labeled "First by"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Required | 
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |          | 
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |          | 
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |          | 
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |          | 
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |          | 
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 2        | 
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 3        | 
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 4        | 
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 5        | 
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 50       |
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter 'Test Report 3' into the input field labeled "Name of Report:" 
    And I enter 'calculated_field "Calculated Field"' into the input field labeled "Field 2" 
    And I enter 'ptname "Name"' into the input field labeled "Field 3" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 4" 
    And I enter 'email_v2 "Email"' into the input field labeled "Field 5" 
    And I enter 'required "Required"' into the input field labeled "Field 6" 
    And I select 'radio_button_manual "Radio Button Manual"' on the dropdown field labeled "Live Filter 1"
    And I select 'record_id "Record ID"' on the dropdown field labeled "Live Filter 2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  | Required |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |          |        
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        | 50       |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |          |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        | 2        |
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     |                        |          |
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Thomas Pipe    | Choice100 (100)     |                        | 3        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |          |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        | 4        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |          |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        | 5        |
    When I select 'Choice99' on the dropdown field labeled "[ Radio Button Manual ]"
    #above step is incorrect because it is not labelled, it will need to say something like 'containing....' 
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  | Required |       
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        | 50       |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        | 4        |
    When I select '1' on the dropdown field labeled "[ Record ID ]"
    #above step is incorrect because it is not labelled, it will need to say something like 'containing....' 
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  | Required |       
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        | 50       |
    
    Given I click on the link labeled "Reset"
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  | Required |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |          |        
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        | 50       |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |          |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        | 2        |
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     |                        |          |
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Thomas Pipe    | Choice100 (100)     |                        | 3        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |          |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        | 4        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |          |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        | 5        |