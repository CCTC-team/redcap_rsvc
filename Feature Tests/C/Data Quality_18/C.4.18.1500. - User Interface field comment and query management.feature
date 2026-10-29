Feature: C.4.18.1500. User Interface: The system shall support configuring field comment and query management functionality, including the Data Resolution Workflow (DRW).

    As a REDCap end user
    I want ensure that I am able to configure field comments and query management functionality on my project so that I can open and resolve data queries through the Data Resolution Workflow

    Scenario: C.4.18.1500.100 Enter a field comment and view it in the Field Comment Log
        #SETUP
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named "C.4.18.1500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

        #FUNCTIONAL_REQUIREMENT
        ##ACTION: configure the Field Comment Log
        When I click on the button labeled "Additional customizations"
        And I select "Field Comment Log" on the dropdown field labeled "Enable the Field Comment Log or Data Resolution Workflow"
        And I click on the button labeled "Save"
        Then I should see "Success! Your changes have been saved."

        ##ACTION: enter a field level comment
        When I click on the link labeled "Add / Edit Records"
        And I select "1" on the dropdown field labeled "select record"
        And I click on the icon in the column labeled "Event 1" and the row labeled "Data Types"
        And I click on the icon labeled "View comment log" in the row labeled "Name"
        And I enter "My field comment" into the textarea field labeled "Comment"
        And I click on the button labeled "Comment"
        And I click on "Save & Exit Form"
        Then I should see "Record ID 1 successfully edited."

        ##VERIFY: field comment is displayed in the Field Comment Log
        When I click on the link labeled "Field Comment Log"
        Then I should see a table header and rows containing the following values in a table:
            | Record | Field   | Comment          |
            | 1      | ptname  | My field comment |

        ##VERIFY_LOG: field comment is recorded in project Logging
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action                | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design         | Add field comment (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname, Comment: "My field comment") |

    Scenario: C.4.18.1500.200 Configure and manage a data query using DRW
        #FUNCTIONAL_REQUIREMENT
        ##ACTION: configure the Data Resolution Workflow
        When I click on the link labeled "Setup"
        And I click on the button labeled "Additional customizations"
        And I select "Data Resolution Workflow" on the dropdown field labeled "Enable the Field Comment Log or Data Resolution Workflow"
        And I click on the button labeled "Save"
        Then I should see "The Data Resolution Workflow has now been enabled!"
        And I click on the button labeled "Close"

        ##ACTION: open and manage a field query
        When I click on the link labeled "Add / Edit Records"
        And I select "1" on the dropdown field labeled "select record"
        And I click on the icon in the column labeled "Event 1" and the row labeled "Data Types"
        And I click on the icon labeled "View data resolution workflow" in the row labeled "Text box"
        And I click on the radio labeled "Open query"
        And I enter "My comment" into the textarea field labeled "Comment"
        And I click on the button labeled "Open query"
        Then I should see "Saved"
        When I click on "Save & Exit Form"
        And I click on the link labeled "Resolve Issues"
        And I click on the button labeled "1 comment" in the row labeled "Text box"
        Then I should see "Action:Opened query"
        And I should see "Comment:“My comment”"
        And I should see "Status:"
        And I should see "Open / Unresolved(unresponded)"
        ##VERIFY_LOG: DRW comment is logged
        When I click on "Cancel"
        And I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action                | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design         | Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: textbox, Comment: "My comment") |

        ##ACTION: close the data query for "Text box"
        When I click on the link labeled "Resolve Issues"
        And I click on the button labeled "1 comment" in the row labeled "Text box"
        And I click on the radio labeled "Close the query"
        And I enter "Closing query" into the textarea field labeled "Comment"
        And I click on the button labeled "Close the query"
        Then I should see "Saved"

        ##VERIFY: query status is closed
        When I click on the link labeled "Resolve Issues"
        Then I should see "No results to display"

        ##VERIFY_LOG: DRW query closure is logged
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action                | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design         | Close data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: textbox, Comment: "Closing query") |

    Scenario: C.4.18.1500.300 Assign a DRW query to test_user1 and resolve it as test_user1
        ##SETUP: add test_user1 to the project with DRW rights
        When I click on the link labeled "User Rights"
        And I enter "Test_User1" into the input field labeled "Add with custom rights"
        And I click on the button labeled "Add with custom rights"
        And I click on the checkbox labeled "Logging"
        And I click on the radio labeled "Open, close, and respond to queries"
        And I click on the button labeled "Add user"
        Then I should see 'User "Test_User1" was successfully added'

        ##ACTION: open a query and assign it to test_user1
        When I click on the link labeled "Add / Edit Records"
        And I select "1" on the dropdown field labeled "select record"
        And I click on the icon in the column labeled "Event 1" and the row labeled "Data Types"
        And I click on the icon labeled "View data resolution workflow" in the row labeled "Text2"
        And I click on the radio labeled "Open query"
        And I select "Test_User1 (Test User1)" on the dropdown field labeled "Assign query to a user (optional):"
        And I enter "Please review this value" into the textarea field labeled "Comment"
        And I click on the button labeled "Open query"
        Then I should see "Saved"
        When I click on "Save & Exit Form"
        Given I logout

        ##ACTION: test_user1 responds to and closes the assigned query
        Given I login to REDCap with the user "Test_User1"
        When I click on the link labeled "My Projects"
        And I click on the link labeled "C.4.18.1500.100"
        And I click on the link labeled "Resolve Issues"
        Then I should see "test_user1" in the row labeled "Text2"
        When I click on the button labeled "1 comment" in the row labeled "Text2"
        Then I should see "Comment:“Please review this value”"
        When I click on the radio labeled "Close the query"
        And I enter "Value verified" into the textarea field labeled "Comment"
        And I click on the button labeled "Close the query"
        Then I should see "Saved"
        And I should see "No results to display"

        ##VERIFY_LOG: assignment, response and closure are logged
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Close data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: text2, Comment: "Value verified") |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: text2, Comment: "Please review this value") |

#END
