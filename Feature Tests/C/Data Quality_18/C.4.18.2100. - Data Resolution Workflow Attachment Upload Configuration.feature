Feature: User Interface: The system shall support configuration of attachment file upload functionality within the Data Resolution Workflow (DRW).

    As a REDCap administrator
    I want to enable or disable attachment uploads and limit their size for data query responses
    So that users can attach supporting files to data queries only when it is allowed

    Scenario: C.4.18.2100 Configure attachment file upload functionality in the Data Resolution Workflow
        #SETUP
        Given I login to REDCap with the user "Test_Admin"

        #SETUP_SYSTEM: Disable attachment uploads for the Data Resolution Workflow
        When I click on the link labeled "Control Center"
        And I click on the link labeled "File Upload Settings"
        And I select "Disabled" on the dropdown field labeled "Allow file attachments to be uploaded for data queries in the Data Resolution Workflow"
        And I click on the button labeled "Save Changes"
        Then I should see "Your system configuration values have now been changed!"

        #SETUP_PROJECT
        When I create a new project named "C.4.18.2100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project418.xml", and clicking the "Create Project" button
        And I click on the button labeled "Additional customizations"
        And I select "Data Resolution Workflow" on the dropdown field labeled "Enable the Field Comment Log or Data Resolution Workflow"
        And I click on the button labeled "Save"
        And I click on the button labeled "Close"

        #SETUP_RESPONDENT: a user who can respond to queries but cannot delete attachments
        When I click on the link labeled "User Rights"
        And I enter "Test_User1" into the input field labeled "Add with custom rights"
        And I click on the button labeled "Add with custom rights"
        Then I should see "Adding new user"

        When I check the radio labeled "Respond only to opened queries"
        And I click on the button labeled "Add user"
        Then I should see "test_user1"

        #SETUP_QUERY: open a query on record 1 (ptname)
        When I click on the link labeled "Add / Edit Records"
        And I select "1" on the dropdown field labeled "select record"
        And I click on the icon in the column labeled "Event 1" and the row labeled "Data Types"
        And I click on the icon labeled "View data resolution workflow" in the row labeled "Name"
        And I click on the radio labeled "Open query"
        And I select "Test_User1 (Test User1)" on the dropdown field labeled "Assign query to a user (optional):"
        And I enter "Please confirm the name and attach supporting documentation." into the textarea field labeled "Comment"
        And I click on the button labeled "Open query"
        Then I should see "Saved!"
        And I wait for 2 seconds
        And I click on the button labeled "Save & Exit Form"

        #FUNCTIONAL_REQUIREMENT: Attachment uploads are not available when disabled
        When I click on the link labeled "Resolve Issues"
        And I click on the button labeled "1 comment" in the row labeled "ptname"
        Then I should see "Please confirm the name and attach supporting documentation."
        And I should NOT see "Upload file (optional):"
        And I should NOT see a link labeled "Upload file"
        And I click on the button labeled "Cancel"

        #FUNCTIONAL_REQUIREMENT: Enable attachment uploads and set a maximum file size
        When I click on the link labeled "Control Center"
        And I click on the link labeled "File Upload Settings"
        And I enter "1" into the field labeled "Upload max file size for general file attachments"
        And I select "Enabled" on the dropdown field labeled "Allow file attachments to be uploaded for data queries in the Data Resolution Workflow"
        And I click on the button labeled "Save Changes"
        Then I should see "Your system configuration values have now been changed!"

        #FUNCTIONAL_REQUIREMENT: Attachment uploads are available when enabled
        When I click on the link labeled "My Projects"
        And I click on the link labeled "C.4.18.2100"
        And I click on the link labeled "Resolve Issues"
        And I click on the button labeled "1 comment" in the row labeled "ptname"
        Then I should see "Upload file (optional):"
        And I should see a link labeled "Upload file"

        #FUNCTIONAL_REQUIREMENT: A file larger than the maximum file size is rejected
        When I click on the link labeled "Upload file"
        And I upload a "csv" format file located at "import_files/RandomizationAllocationTemplate_new.csv", by clicking the button near "Select a file then click the 'Upload File' button" to browse for the file
        And I click on the button labeled "Upload document"
        Then I should see an alert box with the following text: "thus exceeding the maximum file size limit of 1 MB"
        And I should see "There was an error during file upload"
        And I click on the button labeled "Close"

        #FUNCTIONAL_REQUIREMENT: A file within the maximum file size is accepted and attached to the response
        When I click on the link labeled "Upload file"
        And I upload a "csv" format file located at "import_files/testusers_bulkupload.csv", by clicking the button near "Select a file then click the 'Upload File' button" to browse for the file
        And I click on the button labeled "Upload document"
        Then I should see "Document was successfully uploaded"
        And I click on the button labeled "Close"
        And I should see "testusers_bulkupload.csv"

        When I select "Corrected - Typographical error" on the dropdown field labeled "Reply with response:"
        And I enter "The name has been corrected, see attached file." into the textarea field labeled "Comment"
        And I click on the button labeled "Respond to query"
        Then I should see "Saved!"
        And I wait for 2 seconds

        #VERIFY: The attachment is displayed with the query response
        When I click on the link labeled "Resolve Issues"
        And I click on the button labeled "2 comments"
        #  And I click on the button labeled "2 comments" in the row labeled "ptname"
        Then I should see "Uploaded file:"
        And I should see "testusers_bulkupload.csv"
        And I click on the button labeled "Cancel"

        #VERIFY: The upload is logged
        When I click on the link labeled "Logging"
        Then I should see "Upload document for data query response"
        And I logout

        #FUNCTIONAL_REQUIREMENT: Only administrators may delete an attachment
        Given I login to REDCap with the user "Test_User1"
        When I click on the link labeled "My Projects"
        And I click on the link labeled "C.4.18.2100"
        And I click on the link labeled "Resolve Issues"
        And I click on the button labeled "2 comments" 
        Then I should see "testusers_bulkupload.csv"

        When I click on the link labeled "Delete File"
        Then I should see "Only REDCap administrators may delete uploaded files from data queries"
        And I click on the button labeled "Close"
        # And I click on the button labeled "Cancel"
        And I logout

        #FUNCTIONAL_REQUIREMENT: An administrator can delete an attachment
        Given I login to REDCap with the user "Test_Admin"
        When I click on the link labeled "My Projects"
        And I click on the link labeled "C.4.18.2100"
        And I click on the link labeled "Resolve Issues"
        And I click on the button labeled "2 comments"
        And I click on the link labeled "Delete File"
        Then I should see "Are you sure you wish to delete this file from the data query?"

        When I click on the button labeled "Delete"
        Then I should see "SUCCESS! The attachment was successfully deleted from the data query."
        And I wait for 3 seconds

        #VERIFY: The attachment is removed from the data query
        When I click on the link labeled "Resolve Issues"
        And I click on the button labeled "2 comments" 
        Then I should see "The name has been corrected, see attached file."
        And I should NOT see "testusers_bulkupload.csv"
        And I click on the button labeled "Cancel"
        And I click on the link labeled "Home"
#END
