Feature: D.115.200 - The system shall support additional customization of PDF of instruments

  As a REDCap end user
  I want to see that additional customization of PDF of instruments is working as expected

  Scenario: Additional customization of PDF of instruments
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.115.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_.xml", and clicking the "Create Project" button
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Additional Customizations"
    When I check the checkbox labeled "PDF Customizations"
    And I enter "CRF Version 1" into the input field labeled "1)"
    And I select the radio option "Hide REDCap logo/URL and instead display the following text:  Powered by REDCap" for the field labeled "2)"
    # 3) is tested in D.116.400 (Secondary Unique Field)
    # 4) Display Record ID in PDF header
    And I should see the dropdown field labeled "4)" with the option "Keep it displayed" selected
    When I click on the button labeled "Save"
    Then I should see "Sucess! Your changes have been saved!"

    #VERIFY
    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "1"
    When I click on the button labeled "Choose action for record"
    And I click on the link labeled "Download PDF of record data for all instruments/events"
    Then I should see the following values in the downloaded PDF "D.115.200_yyyy-mm-dd_hhmm.pdf"
      | CRF Version 1                                                   |
      |                                               D.115.200         |
      |                                       Record ID 1 (Event 1)     |
      | Text Validation                                                 |
      | Record ID                            1                          |
      | Name                                                            |
      | Email                                                           |
      | Data Types                                                      |
      | Name                                                            |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Calculated Field                    6                           |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                                     |
      | Section Break                                                   |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                                                |
      |                                             Powered by REDCap   |

    #VERIFY_LOG
    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                        | List of Data Changes OR Fields Exported          |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |

    Given I click on the link labeled "Project Setup"
    And I click on the button labeled "Additional Customizations"
    And I enter "CRF Version 2" into the input field labeled "1)"
    And I select the radio option "Display REDCap logo and website URL (default)" for the field labeled "2)"
    # 4) Hide Record ID from PDF header
    And I select "Hide it" on the dropdown field labeled "4)"
    When I click on the button labeled "Save"
    Then I should see "Sucess! Your changes have been saved!"

    #VERIFY
    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "1"
    When I click on the button labeled "Choose action for record"
    And I click on the link labeled "Download PDF of record data for all instruments/events"
    Then I should see the following values in the downloaded PDF "D.115.200_yyyy-mm-dd_hhmm.pdf"
      | CRF Version 2                                                   |
      |                                               D.115.200         |
      | Text Validation                                                 |
      | Record ID                            1                          |
      | Name                                                            |
      | Email                                                           |
      | Data Types                                                      |
      | Name                                                            |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Calculated Field                    6                           |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                                     |
      | Section Break                                                   |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                                                |
      |                                     projectredcap.org           |

    And I should NOT see the following values in the downloaded PDF "D.115.200_yyyy-mm-dd_hhmm.pdf"
      | Record ID 1 (Event 1) |

    And I should see the image "REDCapLogo.jpg" in the downloaded PDF "D.115.200_yyyy-mm-dd_hhmm.pdf"