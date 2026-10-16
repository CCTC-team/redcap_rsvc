Feature: C.3.26.1100.	Project Settings – File Repository: The system shall allow authorized users to override the system-defined maximum File Repository upload file size for an individual project to support project-specific file upload requirements.

        As a REDCap end user
        I want to see that file repository is functioning as expected

        Scenario: SETUP project and confirm the system-defined default upload file size is in effect

        #SETUP
                Given I login to REDCap with the user "Test_Admin"
                And I create a new project named "C.3.26.1100." by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
                And I click on the link labeled "My Projects"
                And I click on the link labeled "C.3.26.1100."
                When I click on the link labeled "User Rights"
                And I enter "Test_User1" into the input field labeled "Add with custom rights"
                And I click on the button labeled "Add with custom rights"
                And I click on the button labeled "Add user"
                Then I should see 'User "Test_User1" was successfully added'

        #SETUP Confirm a file that is larger than the project-level override we will apply later can be uploaded successfully under the system-defined default limit
                When I click on the link labeled "File Repository"
                When I click the button labeled "Select files to upload" to select and upload the following file to the File Repository: 
                        | import_files/RandomizationAllocationTemplate_new.csv |
                Then I should see a table header and rows containing the following values in the file repository table:
                        | Name                                     | Time Uploaded    | Comments                |
                        | Data Export Files                        |                  |                         |
                        | PDF Snapshot Archive                     |                  |                         |
                        | Recycle Bin                              |                  |                         |
                        | RandomizationAllocationTemplate_new.csv  | mm/dd/yyyy hh:mm | Uploaded by test_admin. |

        Scenario: C.3.26.1100.0100 ensures an authorized user can override the system-defined maximum File Repository upload file size for an individual project, and that the overridden limit is enforced

        #SETUP Navigate to the Control Center's Edit Project Settings page and select the project
                Given I click on the link labeled "Control Center"
                And I click on the link labeled "Edit Project Settings"
                And I select "C.3.26.1100." on the dropdown field labeled "Choose an existing project to edit its settings:"
                Then I should see "File Repository upload max file size"

        #FUNCTIONAL_REQUIREMENT
        #ACTION override the system-defined maximum File Repository upload file size for this individual project
                When I enter "1" into the input field labeled "File Repository upload max file size"
                And I click on the button labeled "Save Changes"
                Then I should see "Your changes have been saved!"

        ##VERIFY the project-specific override is enforced, rejecting a file that would otherwise be allowed under the system-defined default limit
                And I click on the link labeled "My Projects"
                And I click on the link labeled "C.3.26.1100."
                And I click on the link labeled "File Repository"
                And I click the button labeled "Select files to upload" to select and upload "import_files/RandomizationAllocationTemplate_new.csv" to File Repository and see that the upload failed
                Then I should see "File could not be loaded because it is too large"
                And I should see "Files must be smaller than 1 MB for uploading."

        ##VERIFY files that fall within the new, overridden limit can still be uploaded successfully
                When I click the button labeled "Select files to upload" to select and upload the following file to the File Repository: 
                        | import_files/testusers_bulkupload.csv |
                Then I should see a table header and rows containing the following values in the file repository table:
                        | Name                                     | Time Uploaded    | Comments                |
                        | Data Export Files                        |                  |                         |
                        | PDF Snapshot Archive                     |                  |                         |
                        | Recycle Bin                              |                  |                         |
                        | RandomizationAllocationTemplate_new.csv  | mm/dd/yyyy hh:mm | Uploaded by test_admin. |
                        | testusers_bulkupload.csv                 | mm/dd/yyyy hh:mm | Uploaded by test_admin. |
                And I click on the link labeled "Home"
                And I logout

        Scenario: C.3.26.1100.0200 ensures a user without Control Center access is not an authorized user, and therefore cannot override the File Repository upload file size setting

                Given I login to REDCap with the user "Test_User1"
                Then I should NOT see a link labeled "Control Center"
#End
