Feature: User Interface: The system shall require the event name in the csv file when importing data to a longitudinal study.

  As a REDCap end user
  I want to see that Data import is functioning as expected

  Scenario: B.3.16.700.100 Import requires the event name

    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "B.3.16.700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    # Delete the data as it is easier to verify data import
    And I click on the radio labeled "Delete ALL data in the project" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

    #VERIFY_RSD
    When I click on the link labeled "Record Status Dashboard"
    Then I should see "No records exist yet"

    #FUNCTIONAL REQUIREMENT
    ##ACTION
    When I click on the link labeled "Data Import Tool"
    And I click on the tab labeled "CSV import"
    When I upload a "csv" format file located at "import_files/B316700100_DATA_INACCURATE.csv", by clicking the button near "Upload your CSV file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "ERROR:"
    And I click on the link labeled "RETURN TO PREVIOUS PAGE"

    #VERIFY_RSD
    When I click on the link labeled "Record Status Dashboard"
    Then I should see "No records exist yet"

    When I click on the link labeled "Data Import Tool"
    And I click on the tab labeled "CSV import"
    When I upload a "csv" format file located at "import_files/B316700100_DATA_ACCURATE.csv", by clicking the button near "Upload your CSV file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    And I click on the button labeled "Import Data"
    Then I should see "Import Successful!"

    #VERIFY_RSD
    When I click on the link labeled "Record Status Dashboard"
    Then I should see a link labeled "5"