Feature: D.5.22.300 - The system shall support the ability for reports to link with the following features: Stats & Charts

  As a REDCap end user
  I want to be able to link reports with stats and Charts

  Scenario: D.5.22.500 - link reports with stats and charts
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.5.22.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.REDCap.xml", and clicking the "Create Project" button

    Given I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "import_files/Redcap_Val_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    When I click on the button labeled "Stats & Charts"
    Then I should see "Select a data collection instrument to view"
    And I should see "DISPLAY OPTIONS"