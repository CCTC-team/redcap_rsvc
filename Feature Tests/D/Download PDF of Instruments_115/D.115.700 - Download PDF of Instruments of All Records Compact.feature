
Feature: D.115.700 - The system shall support the ability to download the PDF of data of all instruments/events in a compact mode (fields with data only) of all records

  As a REDCap end user
  I want to be able to download the PDF of data of all instruments/events (compact mode) of all records

  Scenario: Download PDF of data of all instruments/events (compact mode) of all records
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.115.700" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_.xml", and clicking the "Create Project" button

    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I enter "Dave" into the input field labeled "Name"
    Then I enter "dave@abc.com" into the input field labeled "email"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to add a record for the "Text Validation" longitudinal instrument on event "Event 1"
    Then I should see "Adding new Record ID 2"
    And I enter "Paul" into the data entry form field labeled "Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record ID 2 successfully added."

     Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the tab labeled "Other Export Options"
    And I click on the image "Compact PDF" to download "PDF of data collection instruments containing saved data (all records)"
    Then I should see the following values in the downloaded PDF "D115700_yyyy-mm-dd_hhmm.pdf"
      |                                               D.115.700         |
      |                                       Record ID 1 (Event 1)     |
      | Text Validation                                                 |
      | Record ID                            1                          |
      | Name                                 Dave                       |
      | Email                                dave@abc.com               |
      | Data Types                                                      |
      | Calculated Field                    6                           |
      | Section Break                                                   |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Section Break                                                   |
      | Descriptive Text                                                |
      |                                       Record ID 2 (Event 1)     |
      | Text Validation                                                 |
      | Record ID                            2                          |
      | Name                                 Paul                       |

    And I should NOT see the following values in the downloaded PDF "D115700_yyyy-mm-dd_hhmm.pdf"
      | Name                                                            |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                                     |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Email                                                           |

    #VERIFY_LOG
    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported            |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Download all data entry forms as PDF (all records) |
