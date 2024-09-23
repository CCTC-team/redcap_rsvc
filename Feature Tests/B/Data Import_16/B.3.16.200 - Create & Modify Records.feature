Feature: User Interface: The system shall allow data to be uploaded with the csv template to create and modify records.

  Scenario: B.3.16.200.100 Upload csv with new/modified records
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "B.3.16.200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_3.16.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

    #VERIFY_RSD
    When I click on the link labeled "Record Status Dashboard"
    Then I should see "No records exist yet"

    When I click on the link labeled "Data Import Tool"
    Then I should see "Download your Data Import Template (with records in rows)"

    # #FUNCTIONAL REQUIREMENT
    # ##ACTION - Cancel import
    # #B.3.16.100 CROSSFUNCTIONAL
    When I upload a "csv" format file located at "import_files/B316200100_ImportTemplate_ImportRecord.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the link labeled "Cancel"

    #VERIFY_RSD: no records imported
    When I click on the link labeled "Record Status Dashboard"
    Then I should see "No records exist yet"

    #VERIFY_LOG
    When I click on the link labeled "Logging"
    Then I should NOT see "Create record"

    #FUNCTIONAL REQUIREMENT
    ##ACTION - Import (with records in rows)
    Given I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "import_files/B316200100_ImportTemplate_ImportRecord.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"

    When I click on the button labeled "Import Data"
    Then I should see "Import Successful!"

    #VERIFY_RSD: 1 record
     When I click on the link labeled "Record Status Dashboard"
    Then I should see a link labeled exactly "1"
    When I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
    Then  I should see "Joe" in the data entry form field "Name" 
    Then  I should see "joe@test.edu" in the data entry form field "Email" 

    #VERIFY_LOG
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Username   | Action                   | List of Data Changes OR Fields Exported              |
      | test_admin | Create record (import) 1 |record_id = '1', name = 'Joe', email = 'joe@test.edu' |

    #FUNCTIONAL REQUIREMENT
    ##ACTION - Import (with records in columns) and verify record modification
    When I click on the link labeled "Data Import Tool"
    And I select "Columns" on the dropdown field labeled "Record format"
    When I upload a "csv" format file located at "import_files/B316200100_ImportTemplate_ImportRecord_Column.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"
    Then I should see "Import Successful!"

    #VERIFY_RSD: 2 records
     When I click on the link labeled "Record Status Dashboard"
    Then I should see a link labeled exactly "2"
    When I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
    Then  I should see "Jack" in the data entry form field "Name" 
    Then  I should see "jack@test.edu" in the data entry form field "Email" 

    When I click on the link labeled "Record Status Dashboard"
    Then I should see a link labeled exactly "2"
    When I click on the bubble for the "Text Validation" data collection instrument for record ID "2" 
    Then  I should see "Jill" in the data entry form field "Name" 
    Then  I should see "jill@test.edu" in the data entry form field "Email" 

    #VERIFY_LOG
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Username   | Action                   | List of Data Changes OR Fields Exported                 |
      | test_admin | Create record (import) 2 | record_id = '2', name = 'Jill', email = 'jill@test.edu' |
      | test_admin | Update record (import) 1 | name = 'Jack', email = 'jack@test.edu'                  |
