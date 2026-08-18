Feature: D.21.800 - The system shall support the option to organize stored files into subfolders by REDCap project ID

  As a REDCap end user
  I want to see that uploaded files are stored in - and exported from - the backend location that the
  "Organize the stored files into subfolders by REDCap project ID?" setting dictates

  # BACKGROUND (Control Center > File Upload Settings > Local Server File Storage)
  # The setting is applied to a project only at the moment the project is CREATED
  # (Project::setDefaults() stamps redcap_projects.local_storage_subfolder = 'pid<project_id>'),
  # so each half of this test flips the setting BEFORE creating its project.
  # Nothing in the UI shows where a file physically landed, so the "should be stored in the ..."
  # steps read the container filesystem and compare it to redcap_projects.local_storage_subfolder.
  # The local file storage location itself is set to /var/www/html/redcap_file_repository/ - see D.3.28.0100.
  #
  # NOTE on the dropdown steps below: file_upload_settings.php prints this same label (lang key
  # system_config_915) TWICE - once for Local Server File Storage and again in the Google Cloud
  # Storage section - so the label alone is ambiguous. The step resolves to the local one only
  # because that row comes first in the DOM. If REDCap ever reorders that page the step would
  # start setting the Google Cloud Storage dropdown instead; the storage assertions below would
  # then fail rather than pass wrongly, so a failure here is the signal to target
  # select[name=local_storage_use_project_subfolder] explicitly.

  Scenario: D.21.800.100 - Subfolder storage DISABLED: files are stored in the main file storage folder
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    When I click on the link labeled "Control Center"
    And I click on the link labeled "File Upload Settings"
    Then I should see "Local Server File Storage"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION: Disable subfolder storage before the project is created
    When I select "Disabled" on the dropdown field labeled "Organize the stored files into subfolders by REDCap project ID?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Create a project and upload a file to a 'File Upload' field
    Given I create a new project named "D.21.800.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val/Project_redcap_val.xml", and clicking the "Create Project" button
    When I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "import_files/redcap_val/file1.csv", by clicking the button near "Select a file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I click on the button labeled "Close"
    Then I should see a link labeled "file1.csv (0.01 MB)"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

    ##VERIFY backend folder structure - no subfolder, file sits directly in the storage folder
    Then the uploaded files for the project named "D.21.800.100" should be stored in the main file storage folder

    ##VERIFY the file downloads from the record (file_download.php resolves the same path)
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1.csv (0.01 MB)"

    ##VERIFY export - the ZIP is built by reading each edoc off disk, so a wrong path
    ## silently drops the file from the archive rather than erroring
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the link labeled "Other Export Options"
    When I click on the icon ZIP to download ZIP file of uploaded files
    Then I should see a downloaded file named "Files_D21800100_yyyy-mm-dd_hhmm.zip" within 30 seconds
    When I unzip the latest downloaded zip file
    Then the downloaded CSV with filename "unzipped/Files_D21800100_yyyy-mm-dd_hhmm/documents/2_event_1_arm_1_data_types_1_file_upload.csv" has the header below
      | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete |

  Scenario: D.21.800.200 - Subfolder storage ENABLED: files are stored in a subfolder named by project ID
    #FUNCTIONAL_REQUIREMENT
    ##ACTION: Enable subfolder storage before the project is created
    Given I click on the link labeled "Control Center"
    And I click on the link labeled "File Upload Settings"
    Then I should see "Local Server File Storage"

    When I select "Enabled" on the dropdown field labeled "Organize the stored files into subfolders by REDCap project ID?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"

    ##ACTION: Create a project and upload a file to a 'File Upload' field
    Given I create a new project named "D.21.800.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val/Project_redcap_val.xml", and clicking the "Create Project" button
    When I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "import_files/redcap_val/file1.csv", by clicking the button near "Select a file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I click on the button labeled "Close"
    Then I should see a link labeled "file1.csv (0.01 MB)"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

    ##VERIFY backend folder structure - the file now sits in a pid<project_id> subfolder
    Then the uploaded files for the project named "D.21.800.200" should be stored in the project ID subfolder

    ##VERIFY the file downloads from the record
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1.csv (0.01 MB)"

    ##VERIFY export still finds the file now that it lives one directory deeper
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the link labeled "Other Export Options"
    When I click on the icon ZIP to download ZIP file of uploaded files
    Then I should see a downloaded file named "Files_D21800200_yyyy-mm-dd_hhmm.zip" within 30 seconds
    When I unzip the latest downloaded zip file
    Then the downloaded CSV with filename "unzipped/Files_D21800200_yyyy-mm-dd_hhmm/documents/2_event_1_arm_1_data_types_1_file_upload.csv" has the header below
      | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete |

  Scenario: D.21.800.300 - Enabling the setting does not move or orphan files of existing projects
    #FUNCTIONAL_REQUIREMENT
    ##ACTION: Return to the project created while subfolder storage was DISABLED. The setting
    ## "will not affect existing projects" (lang system_config_914), so its files must stay put
    ## and must still be reachable now that subfolder storage is on system-wide.
    Given I click on the link labeled "My Projects"
    # Gate on the project list having rendered: clicking straight through races the
    # navigation on a loaded machine and the project link is then not yet in the DOM
    Then I should see "Listed below are the REDCap project"
    And I click on the link labeled "D.21.800.100"

    ##VERIFY the older project's files were left in the main file storage folder
    Then the uploaded files for the project named "D.21.800.100" should be stored in the main file storage folder

    ##VERIFY export of the older project still works
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the link labeled "Other Export Options"
    When I click on the icon ZIP to download ZIP file of uploaded files
    Then I should see a downloaded file named "Files_D21800100_yyyy-mm-dd_hhmm.zip" within 30 seconds
    When I unzip the latest downloaded zip file
    Then the downloaded CSV with filename "unzipped/Files_D21800100_yyyy-mm-dd_hhmm/documents/2_event_1_arm_1_data_types_1_file_upload.csv" has the header below
      | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete |

    And I logout
