Feature: D.5.22.300 - The system shall support the ability to limit fields included in a report.

  As a REDCap end user
  I want to be able to limit fields included in a report. 

  Scenario: D.5.22.300 - Limit Fields in a Report
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.5.22.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.REDCap.xml", and clicking the "Create Project" button

    Given I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "import_files/Redcap_Val_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter 'Test Report 1' into the input field labeled "Name of Report:" 
    And I enter 'calculated_field "Calculated Field"' into the input field labeled "Field 2" 
    And I enter 'ptname "Name"' into the input field labeled "Field 3" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 4" 
    And I enter 'email_v2 "Email"' into the input field labeled "Field 5" 
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     |                        |
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Thomas Pipe    | Choice100 (100)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    When I enter "50" into the input field labeled "Required"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'required "Required"' on the dropdown field labeled "Filter 1"
    And I select the operator "=" for filter "1"
    And I enter the value "50" for filter "1"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
   
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'record_id "Record ID"' on the dropdown field labeled "Filter 1"
    And I select the operator "not =" for filter "1"
    And I enter the value "3" for filter "1"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    this is where i found the bug. In reality this is not what shows because there are also empty rows for 'Event three' 

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'record_id "Record ID"' on the dropdown field labeled "Filter 1"
    And I select the operator "not =" for filter "1"
    And I enter the value "3" for filter "1"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'radio_button_manual "Radio Button Manual"' on the dropdown field labeled "Filter 1"
    And I select the operator "=" for filter "2"
    And I enter the value "100" for filter "2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "<" for filter "2"
    And I enter the value "4" for filter "2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "<" for filter "2"
    And I enter the value "4" for filter "2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |

    Many of these actually continue to be incorrect technically because of the empty 'event three' rows. 

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "contains" for filter "3"
    And I enter the value "o" for filter "3"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "ends with" for filter "3"
    And I enter the value "zxz" for filter "3"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see "No results were returned"

    Given I click on the link labeled "Project Setup"
    When I click on the button labeled "Designate Instruments for My Events"
    And I click on the tab labeled "Arm 1"
    And I click on the button labeled "Begin Editing"
    And I enable the Data Collection Instrument named "Data Types" for the Event named "Event 2"
    Then I click on the button labeled "Save" on the Designate Instruments for My Events page

    Given I click on the link labeled "Record Status Dashboard"
    When I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "1" and click on the bubble
    And I enter "Ryan Test" into the input field labeled "Name"
    And I enter "9" into the input field labeled "Required"
    And I select the radio option "Choice101" for the field labeled "Radio Button Manual"
    And I select "DDchoice5" on the dropdown field labeled "Multiple Choice Dropdown Manual"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    When I enter 'Test Report 2' into the input field labeled "Name of Report:" 
    And I enter 'calculated_field "Calculated Field"' into the input field labeled "Field 2" 
    And I enter 'ptname "Name"' into the input field labeled "Field 3" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 4" 
    And I enter 'multiple_dropdown_manual "Multiple Choice Dropdown Manual"' into the input field labeled "Field 5" 
    And I enter 'required "Required"' into the input field labeled "Field 6" 
    And I select "Event 2 (Arm 1: Arm 1)" on the multiselect field labeled "Filter by event(s):"
    And I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Multiple Choice Dropdown Manual | Required |
    | 1         | Event 2 (Arm 1: Arm 1) |                   | 1               | 6                |                | Choice101 (101)     | DDChoice5 (5)                   | 9        |

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    When I enter 'Test Report 3' into the input field labeled "Name of Report:" 
    And I enter 'calculated_field "Calculated Field"' into the input field labeled "Field 2" 
    And I enter 'ptname "Name"' into the input field labeled "Field 3" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 4" 
    And I enter 'multiple_dropdown_manual "Multiple Choice Dropdown Manual"' into the input field labeled "Field 5" 
    And I enter 'required "Required"' into the input field labeled "Field 6" 
    And I select 'record_id "Record ID"' on the dropdown field labeled "Filter 1"
    And I select the operator "=" for filter "1"
    And I enter the value "1" for filter "1"
    And I uncheck the checkbox labeled "Include the repeating instance fields (redcap_repeat_instrument, redcap_repeat_instance) in the report and data export?"
    And I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Calculated Field | Name           | Radio Button Manual | Multiple Choice Dropdown Manual | Required |
    | 1         | Event 1 (Arm 1: Arm 1) | 6                | Lily Brown     |                     |                                 |          |
    | 1         | Event 1 (Arm 1: Arm 1) | 6                |                | Choice99(9..9)      | DDChoice5 (5)                   | 50       |
    | 1         | Event 2 (Arm 1: Arm 1) | 6                |                | Choice101 (101)     | DDChoice5 (5)                   | 9        |


# this is the start of the potentially pointless line break section 


    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "1" and click on the bubble
    When I enter "test then carriage return\r\nthen further test and then another carriage return\r\nand then some final text" into the input field labeled "Notes Box"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    When I enter 'Test Report 4' into the input field labeled "Name of Report:"
    And I enter 'notesbox "Notes Box"' into the input field labeled "Field 2"
    And I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I select "Event 2 (Arm 1: Arm 1)" on the multiselect field labeled "Filter by event(s):"
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Notes Box                                                                                                   |
    | 1         | Event 2 (Arm 1: Arm 1) |                   | 1               | test then carriage return\r\nthen further test and then another carriage return\r\nand then some final text |

    Given I click on the button labeled "Edit Report"
    When I uncheck the checkbox labeled "Checkbox3"
    And I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I select "Event 2 (Arm 1: Arm 1)" on the multiselect field labeled "Filter by event(s):"
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Notes Box                                                                                                   |
    | 1         | Event 2 (Arm 1: Arm 1) |                   | 1               | test then carriage return\r\nthen further test and then another carriage return\r\nand then some final text |


# need to speak to mintoo about if i need to check the csv exports here and therefore this whole carriage returns section 
