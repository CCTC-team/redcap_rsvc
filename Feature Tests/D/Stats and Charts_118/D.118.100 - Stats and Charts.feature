
Feature: Stats and Charts: The system shall support the viewing of stats and charts.

    As a REDCap end user
    I want to see that Stats and Charts is functioning as expected

    Scenario: Stats and Charts.
        Given I login to REDCap with the user "Test_Admin"   
        And I create a new project named "D.118.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

        #FUNCTIONAL_REQUIREMENT
        ##ACTION: Import (with records in rows and column)
        Given I click on the link labeled "Data Import Tool"
        When I upload a "csv" format file located at "redcap_val_fixtures/import_files/D.118.100_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        Then I should see "Your document was uploaded successfully and is ready for review"
        And I click on the button labeled "Import Data"
        Then I should see "Import Successful! 15 records were created or modified during the import"

        #VERIFY_RSD: 15 records
        When I click on the link labeled "Record Status Dashboard"
        Then I should see "of 15 records"

        ##VERIFY_DE
        When I click on the link labeled "Data Exports, Reports, and Stats"
        Then I should see a table rows containing the following values in the reports table:  
            | A | All data (all records and fields)  |
            | B | Selected instruments and/or events |
        
        And I click on the button labeled "Stats & Charts" 
        Then I see a table header and rows containing the following values in the report data table:   
            | Display Options                             |
            | Select a data collection instrument to view |

        And I select "Text Validation" on the dropdown field labeled "Select a data collection instrument to view"
        Then I see a table header and rows containing the following values in the report data table: 
            | Name (ptname_v2_v2)                  |           |        |
            | Total Count (N)                      | Missing   |        | 
            | 12                                   | 3 (20.0%) |        |
            | Email (email_v2)                     |           |        |
            | Total Count (N)                      | Missing   |        |
            | 11                                   | 4 (26.7%) |        | 
            | Complete? (text_validation_complete) |           |        |
            | Total Count (N)                      | Missing   | Unique |
            | 15                                   | 0(0.0%)   | 3      |

        And I should see "Counts/frequency: Incomplete (4, 26.7%), Unverified (5, 33.3%), Complete (6, 40.0%)"
        And I should see the dropdown field labeled "Complete?" with the option "View as Bar Chart" selected 
        And I should see "a Bar Chart showing Incomplete count: 4, Unverified count: 5, Complete count: 6"
        When I select "View as Pie Chart" on the dropdown field labeled "Complete?"
        Then I should see "a Pie Chart showing Complete 6(40%), Incomplete 4(26.7%), Unverified 5(33.3%)"

        When I select "Data Types" on the dropdown field labeled "Select a data collection instrument to view"
        Then I see a table header and rows containing the following values in the report data table:  
            | Name (ptname)                                              |           |        |
            | Total Count (N)                                            | Missing   |        |
            | 13                                                         | 2 (13.3%) |        |
            | Text Box (textbox)                                         |           |        |
            | Total Count (N)                                            | Missing   |        |
            | 11                                                         | 4(26.7%)  |        |
            | Multiple Choice Dropdown Manual (multiple_dropdown_manual) |           |        |
            | Total Count (N)                                            | Missing   | Unique |
            | 12                                                         | 3(20.0%)  | 3      |

        Then I should see "Counts/frequency: DDChoice5 (3, 25.0%), DDChoice6 (7, 58.3%), DDChoice7 (2, 16.7%)"
        And I should see the dropdown field labeled "Multiple Choice Dropdown Manual" with the option "View as Bar Chart" selected 
        And I should see "a Bar Chart showing DDChoice5 count: 3, DDChoice6 count: 7, DDChoice7 count: 2"
        When I select "View as Pie Chart" on the dropdown field labeled "Multiple Choice Dropdown Manual"
        Then I should see "a Pie Chart showing DDChoice7 2(16.7%), DDChoice6 7(58.3%), DDChoice5 3(25%)"
       
        Then I should NOT see "File Upload" 
        And I see a table header and rows containing the following values in the report data table: 
            | Calculated Field (calculated_field) |         |        |     |     |      |       |     | Percentile |      |      |             |       |      |      |
            | Total Count (N)                     | Missing | Unique | Min | Max | Mean | StDev | Sum | 0.05       | 0.10 | 0.25 | 0.50 Median | 0.75  | 0.90 | 0.95 |
            | 15                                  | 0(0.0%) | 1      | 6   | 6   | 6    | 0     | 90  | 6          | 6    | 6    | 6           | 6     | 6    | 6    |
        
        And I should see "Lowest values: 6,6,6,6,6"
        And I should see "Highest values: 6,6,6,6,6"
        And I see a table header and rows containing the following values in the report data table:
            | Complete? (data_types_complete) |         |        |
            | Total Count (N)                 | Missing | Unique |
            | 15                              | 0(0.0%) | 3      |

        And I should see "Counts/frequency: Incomplete (6, 40.0%), Unverified (5, 33.3%), Complete (4, 26.7%)"
        And I should see the dropdown field labeled "Complete?" with the option "View as Bar Chart" selected 
        And I should see "a Bar Chart showing Incomplete count: 6, Unverified count: 5, Complete count: 4"
        When I select "View as Pie Chart" on the dropdown field labeled "Complete?"
        Then I should see "a Pie Chart showing Complete 4(26.7%), Incomplete 6(40%), Unverified 5(33.3%)"
        And I should see "Counts/frequency: Incomplete (6, 40%), Unverified (5, 33.3%), Complete (4, 26.7%)"
        When I click on the link labeled "4 (26.7%)"
        Then I should see "Missing values: 10, 13, 14, 15"
        When I click on the link labeled "14"
        Then I should see "" in the data entry form field "Text Box" 
        And I logout
