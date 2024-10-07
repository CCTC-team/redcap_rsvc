Feature: User Interface: The tool shall support the filtering the record list:

  As a REDCap end user
  I want to see that Record locking and E-signatures is functioning as expected

  Scenario: C.2.19.300.100 Record locking and E-signatures filtering
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "C.2.19.300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

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

    #FUNCTIONAL REQUIREMENT
    ##ACTION Lock E-sign instrument
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "3" and click on the bubble
    Then I should see "Text Validation"
    And I should see a checkbox labeled "Lock this instrument?" that is unchecked
    Given I check the checkbox labeled "Lock this instrument?"
    And I check the checkbox labeled exactly "E-signature"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see "E-signature: Username/password verification" in the dialog box
    Given I provide E-Signature credentials for the user "Test_Admin"
    And I click on the button labeled "Save" in the dialog box
    Then I should see "E-signed by test_admin"
    And I should see "Instrument locked by test_admin"

    ##ACTION Lock instrument
     When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Text Validation"
    And I should see a checkbox labeled "Lock this instrument?" that is unchecked
    Given I check the checkbox labeled "Lock this instrument?"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I should see "Instrument locked by test_admin"

    ##VERIFY_LOCK_ESIG: Record instrument lock on Locking Management
    When I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I click on the button labeled "I understand. Let me make changes" in the dialog box
    And I click on the link labeled "E-signature and Locking Management"
    When I click on the link labeled "SHOW ALL ROWS"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] |                 |
      | 1      | Event Three (Arm 1: Arm 1) | Survey          |                 |             | N/A             |
      | 1      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #1           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #2           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 2      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 2      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 2      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] | [e-signed icon] |
      | 3      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 3      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #3           |             | N/A             |

    When I click on the link labeled "Show locked"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] |                 |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] | [e-signed icon] |

    When I click on the link labeled "Show timestamp / user"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?                 | E-signed?               |
      # | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | mm/dd/yyyy hh:mm        |                         |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | test_admin (Admin User) |                         |
      # | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | mm/dd/yyyy hh:mm        | mm/dd/yyyy hh:mm        |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | test_admin (Admin User) | test_admin (Admin User) |

    When I click on the link labeled "Hide timestamp / user"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] |                 |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] | [e-signed icon] |

    When I click on the link labeled "Show not e-signed (excludes N/A)"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #1           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #2           |             |                 |
      | 2      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 4      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |

    When I click on the link labeled "Show e-signed"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] | [e-signed icon] |

    When I click on the link labeled "Show not locked"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event Three (Arm 1: Arm 1) | Survey          |                 |             | N/A             |
      | 1      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #1           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #2           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 2      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 2      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 2      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 3      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 3      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #1           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #2           |             | N/A             |
      | 4      | Event 1 (Arm 1: Arm 1)     | Data Types      |    #3           |             | N/A             |

    When I click on the link labeled "Show neither locked nor e-signed (excludes N/A)"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #1           |             |                 |
      | 1      | Event 2 (Arm 1: Arm 1)     | Text Validation |    #2           |             |                 |
      | 2      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |
      | 4      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 |             |                 |

    When I click on the link labeled "Show both locked and e-signed"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 3      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] | [e-signed icon] |

    When I click on the link labeled "Show locked but not e-signed (excludes N/A)"
    Then I should see a table header and rows containing the following values in a table:
      | Record | Event Name                 | Form Name       | Repeat Instance | Locked?     | E-signed?       |
      | 1      | Event 1 (Arm 1: Arm 1)     | Text Validation |                 | [lock icon] |                 |

    When I click on the button labeled "Export all (CSV)" to download a file
    Then the downloaded CSV with filename "C219300100_EsignLockMgmt_yyyy-mm-dd_hhmm.csv" has a value "3" for column "Record"
    Then the downloaded CSV with filename "C219300100_EsignLockMgmt_yyyy-mm-dd_hhmm.csv" has a value "Event 1 (Arm 1: Arm1)" for column "Event Name"
    Then the downloaded CSV with filename "C219300100_EsignLockMgmt_yyyy-mm-dd_hhmm.csv" has a value "Text Validation" for column "Form Name"
    Then the downloaded CSV with filename "C219300100_EsignLockMgmt_yyyy-mm-dd_hhmm.csv" has a value " " for column "Repeat Instance"
    Then the downloaded CSV with filename "C219300100_EsignLockMgmt_yyyy-mm-dd_hhmm.csv" has a value "MM/DD/YYYY" for column "Locked?"
    Then the downloaded CSV with filename "C219300100_EsignLockMgmt_yyyy-mm-dd_hhmm.csv" has a value "N/A" for column "E-signed?"