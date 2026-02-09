Feature: D.21.700 - Verify hash value of the exported file formats: CSV, SPSS, SAS, R, STATA, and CDISC ODM (XML).

  As a REDCap end user
  I want to see that export data is verified

  Scenario: B.5.21.200.100 Export data format
    #SETUP
    Given I login to REDCap with the user "Test_User1"
    And I create a new project named "D.21.700" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export CSV raw
    When I click on the link labeled "Data Exports, Reports, and Stats"
    Then I should see a table row containing the following values in the reports table:
      | A | All data (all records and fields) |

    Given I click on the button labeled "Export Data" for the report named "All data (all records and fields)"
    And I click on the radio labeled "CSV / Microsoft Excel (raw data)"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "CSV / Microsoft Excel (raw data)" format
    Then I should see a downloaded file named "D21700_DATA_yyyy-mm-dd_hhmm.csv"
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "csv" file with SHA256 hash value "5a250f27286860bcf82427090bf9a041821402d0cf25f452d183ed8e402c29c6"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export CSV (labels)
    When I click on the button labeled "Export Data" for the report named "All data (all records and fields)"
    And I click on the radio labeled "CSV / Microsoft Excel (labels)"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "CSV / Microsoft Excel (labels)" format
    Then I should see the latest downloaded "csv" file containing the headings below
      | "Record ID" | "Event Name" | "Repeat Instrument" | "Repeat Instance" | "Data Access Group" | "Survey Identifier" | Name | Email | Complete? | Name | "Text box" | Text2 | radio | "Notes box" | "Multiple Choice Dropdown Manual" | "Multiple Choice dropdown Auto" | "Radio Button Auto" | "Radio Button Manual" | "Checkbox (choice=Checkbox1)" | "Checkbox (choice=Checkbox2)" | "Checkbox (choice=Checkbox3)" | "Calc Test" | "Calculated Field" | Signature | "File Upload" | Required | Identifier | Identifier | "Edit Field" | "date YMD" | "date MDY" | "date DMY" | "time HH:MM:SS" | "time HH:M" | "time MM:SS" | "datetime YMD HMSS" | "datetime YMD HM" | "datetime MDY HMSS" | "datetime DMY HMSS" | "Integer " | Numbers | "Numbers 1 decimal place - period as decimal " | "Numbers 1 decimal place - comma as decimal " | "Letters only" | "MRN (10 Digits)" | "MRN (generic)" | "Social Security Number (US)" | "Phone (North America)" | "Phone (Australia)" | "Phone (UK)" | "Zipcode (US)" | "Postal code 5 (France)" | "Postal Code (Australia)" | "Postal Code (Canada)" | Complete? | "Survey Timestamp" | Name | Email | Complete? | "Survey Timestamp" | Name | Email | DOB | "Signature " | Complete? |
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "csv" file with SHA256 hash value "eeb5aaa4727da3c617a0eb6aed29a989bf0a7058a4e5ef67856e463c3aa520f6"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export SPSS
    Given I click on the button labeled "Export Data" for the report named "Test Report"
    And I click on the radio labeled "SPSS Statistical Software"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "SPSS Statistical Software" format
    Then I should see a downloaded file named "D21700-TestReport_SPSS_yyyy-mm-dd_hhmm.sps"
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "sps" file with SHA256 hash value "34e24fcab5433c4e66e913c8a34491c7474dbbb0e72809d125f10fcc84cdc4c0"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export SAS
    Given I click on the button labeled "Export Data" for the report named "Test Report"
    And I click on the radio labeled "SAS Statistical Software"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"
    Given I click on the download icons to receive the files for the "SAS Statistical Software" format
    Then I should see a downloaded file named "D21700-TestReport_SAS_yyyy-mm-dd_hhmm.sas"
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "sas" file with SHA256 hash value "06a8f6ca3e7ea4cf3ec69ddf79756707a1325ae6627e3f8ca5e9c95a25faf72b"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export R
    Given I click on the button labeled "Export Data" for the report named "All data (all records and fields)"
    And I click on the radio labeled "R Statistical Software"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "R Statistical Software" format

    Then I should see a downloaded file named "D21700_R_yyyy-mm-dd_hhmm.r"
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "r" file with SHA256 hash value "5ff8b4ba5a70457d8ec6a33cc5997ff7b09e59391bb40c39e28c0b057a7b00b2"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export STATA
    Given I click on the button labeled "Export Data" for the report named "Test Report"
    And I click on the radio labeled "Stata Statistical Software"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "Stata Statistical Software" format
    Then I should see a downloaded file named "D21700-TestReport_STATA_yyyy-mm-dd_hhmm.do"
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "do" file with SHA256 hash value "489ffb7820ec0d3b84f7a0edc4c45f8f72311168aef9449b5b50babbc096cd5b"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: export XML
    Given I click on the button labeled "Export Data" for the report named "All data (all records and fields)"
    And I click on the radio labeled "CDISC ODM (XML)"
    And I click on the button labeled "Export Data"
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "CDISC ODM (XML)" format
    Then I should see a downloaded file named "D21700_CDISC_ODM_yyyy-mm-dd_hhmm.xml"
    #Manual Close file

    And I click on the button labeled "Close"
    And I should have the latest downloaded "xml" file with SHA256 hash value "c1c7c30f96649d30b9560c6ad9cab3d2f347d3a41913f02bf7e15f423f6cebb3"
    And I logout