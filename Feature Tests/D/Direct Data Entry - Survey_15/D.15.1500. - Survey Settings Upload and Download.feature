Feature: D.15.1500 - The system shall support downloading the Survey Settings of all surveys in a project as a CSV file, and uploading a CSV file to add or modify Survey Settings, rejecting the whole upload when any value is invalid.

  As a REDCap end user
  I want to download the Survey Settings as a CSV file, and upload a CSV file to add or modify Survey Settings

  Scenario: D.15.1500.100 Download and upload Survey Settings (CSV)
    #SETUP
    Given I login to REDCap with the user "Test_User1"
    And I create a new project named "D.15.1500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val/Project_redcap_val.xml", and clicking the "Create Project" button

    #SETUP Enable surveys, and enable Text Validation as a survey
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Enable" in the row labeled "Use surveys in this project?"
    Then I should see a button labeled "Disable" in the row labeled "Use surveys in this project?"

    Given I click on the link labeled "Designer"
    When I click on the button labeled "Enable" in the column labeled "Enabled as" and the row labeled "Text Validation"
    And I click on the button labeled "Save Changes"
    Then I should see "Your survey settings were successfully saved!"

    #FUNCTIONAL REQUIREMENT
    ##ACTION Download the Survey Settings
    Given I click on the link labeled "Designer"
    When I click on the button labeled "Survey Settings"
    And I click on the link labeled "Download Survey Settings (CSV)"

    ##VERIFY The CSV holds one row (plus the header), with the settings of the Text Validation survey
    Then the downloaded CSV with filename "D151500100_SurveySettings_yyyy-mm-dd_hhmm.csv" has 2 rows
    And the downloaded CSV with filename "D151500100_SurveySettings_yyyy-mm-dd_hhmm.csv" has the header and rows below
      | form_name       | survey_enabled | title           | text_size | save_and_return | end_survey_redirect_next_survey |
      | text_validation | Y              | Text Validation | LARGE     | N               | N                               |

    ##ACTION Upload a CSV with an invalid value
    Given I click on the link labeled "Designer"
    When I click on the button labeled "Survey Settings"
    And I click on the link labeled "Upload Survey Settings (CSV)"
    Then I should see "You may import the Survey Settings for *all* surveys in a single CSV file"
    When I upload a "csv" format file located at "import_files/redcap_val/D.15.1500_SurveySettings_Invalid.csv", by clicking the button near "Choose and upload CSV file" to browse for the file

    ##VERIFY The upload is rejected with the invalid value listed
    Then I should see "Please review the issues listed below"
    And I should see "Invalid value for text_size: HUGE"
    ## Closing the dialog reloads the Online Designer
    And I click on the button labeled "Close"
    And I wait for 2 seconds

    ##VERIFY Nothing from the rejected file was saved: the settings are unchanged
    When I click on the button labeled "Survey Settings"
    And I click on the link labeled "Download Survey Settings (CSV)"
    Then the downloaded CSV with filename "D151500100_SurveySettings_yyyy-mm-dd_hhmm.csv" has 2 rows
    And the downloaded CSV with filename "D151500100_SurveySettings_yyyy-mm-dd_hhmm.csv" has the header and rows below
      | form_name       | survey_enabled | title           | text_size | save_and_return | end_survey_redirect_next_survey |
      | text_validation | Y              | Text Validation | LARGE     | N               | N                               |

    ##ACTION Upload a valid CSV: modify Text Validation, and add Data Types as a survey
    When I click on the button labeled "Survey Settings"
    And I click on the link labeled "Upload Survey Settings (CSV)"
    And I upload a "csv" format file located at "import_files/redcap_val/D.15.1500_SurveySettings.csv", by clicking the button near "Choose and upload CSV file" to browse for the file

    ##VERIFY Both instruments are listed as uploaded
    Then I should see "Survey settings were successfully uploaded!"
    And I should see "The Survey settings were successfully added or modified for the following instruments:"
    And I should see "Text Validation"
    And I should see "Data Types"
    ## Closing the dialog reloads the Online Designer
    And I click on the button labeled "Close"
    And I wait for 2 seconds

    ##ACTION Download the Survey Settings again
    When I click on the button labeled "Survey Settings"
    And I click on the link labeled "Download Survey Settings (CSV)"

    ##VERIFY Text Validation has the uploaded values, and Data Types is now a survey with the uploaded values
    Then the downloaded CSV with filename "D151500100_SurveySettings_yyyy-mm-dd_hhmm.csv" has 3 rows
    And the downloaded CSV with filename "D151500100_SurveySettings_yyyy-mm-dd_hhmm.csv" has the header and rows below
      | form_name       | survey_enabled | title                 | text_size | save_and_return | end_survey_redirect_next_survey |
      | text_validation | Y              | D15 Uploaded Title    | LARGE     | Y               | N                               |
      | data_types      | Y              | D15 Data Types Survey | LARGE     | N               | N                               |

    ##VERIFY_LOG
    When I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Username   | Action        | List of Data Changes OR Fields Exported |
      | test_user1 | Manage/Design | Upload settings for surveys             |
      | test_user1 | Manage/Design | Download survey settings                |

    And I logout
