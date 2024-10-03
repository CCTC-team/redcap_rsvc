Feature: User Interface: The E-signature and Locking Management tool shall display all records in a database with their status as locked or e-signed for all data entry forms.

  As a REDCap end user
  I want to see that Record locking and E-signatures is functioning as expected

  Scenario: C.2.19.100.100 Display locked and e-signed status
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "C.2.19.100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

    #SETUP
    When I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I click on the button labeled "I understand. Let me make changes" in the dialog box
    Given the Column Name "Display the Lock option for this instrument?", I uncheck the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Consent"
    And for the Column Name "Also display E-signature option on instrument?", I check the checkbox within the Record Locking Customization table for the Data Collection Instrument named "Text Validation"
    Then I should see a table header and rows containing the following values in a table:
      | Display the Lock option for this instrument? | Data Collection Instrument | Also display E-signature option on instrument? | Lock Record Custom Text |
      | [✓]                                          | Text Validation            | [✓]                                           | [text box]              |
      | [✓]                                          | Data Types                 | [ ]                                           | [text box]              |
      | [✓]                                          | Survey                     | [ ]                                           | [text box]              |
      | [ ]                                          | Consent                    | [ ]                                           | [text box]              |

    
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Text Validation"
    Given I check the checkbox labeled exactly "Lock"
    And I check the checkbox labeled exactly "E-signature"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see "E-signature: Username/password verification" in the dialog box
    Given I provide E-Signature credentials for the user "Test_Admin"
    And I click on the button labeled "Save" in the dialog box
    Then I should see "E-signed by test_admin"
    And I should see "Instrument locked by test_admin"

    When I click on the link labeled "Data Types"
    Then I should see "Data Types"
    Given I check the checkbox labeled exactly "Lock"
    And I should NOT see a checkbox labeled "E-signature"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see "Instrument locked by test_admin"
    And I should NOT see "E-signed by test_admin"

    When I click on the link labeled "Consent"
    Then I should NOT see a checkbox labeled "E-signature"
    And I should NOT see a checkbox labeled "Lock"
    
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Survey" instrument on event "Event Three" for record ID "1" and click on the bubble
    Then I should see "Survey"
    And I should see a checkbox labeled exactly "Lock" that is unchecked
    And I should NOT see a checkbox labeled "E-signature"

    #FUNCTIONAL REQUIREMENT
    ##ACTION Edit / Remove Custom Text
    When I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I click on the button labeled "I understand. Let me make changes" in the dialog box

    ##VERIFY
    When I click on the link labeled "E-signature and Locking Management"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] | [e-signed icon] |
      | 1      | Event Three (Arm 1: Arm 1) | Survey          |                 |             | N/A             |
      | 1      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           | [lock icon] | N/A             |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #1           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #2           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 2      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 2      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 2      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 3      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 3      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #3           |             | N/A             |

    ##VERIFY C.2.19.200
    And I should NOT see "Consent"

    ##VERIFY_LOG
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in a table:
      | Username   | Action               | List of Data ChangesOR Fields Exported                                  |
      | test_admin | Lock/Unlock Record 1 | Action: Lock instrument Record: 1 Form: Data Types Event: Event 1       |
      | test_admin | E-signature 1        | Action: Save e-signature Record: 1 Form: Text Validation Event: Event 1 |
      | test_admin | Lock/Unlock Record 1 | Action: Lock instrument Record: 1 Form: Text Validation Event: Event 1  |