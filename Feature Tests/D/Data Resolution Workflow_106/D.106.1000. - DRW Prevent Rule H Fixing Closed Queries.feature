Feature: D.106.1000 - The system shall support the ability to prevent calc/CALCTEXT fields with closed/verified data queries from being fixed by Data Quality rule H when using the Data Resolution Workflow

    As a REDCap end user
    I want to see that calculated fields with a closed data query are not fixed by "Fix calcs now" when the setting is enabled
    I want to see that calculated fields with a closed data query are fixed by "Fix calcs now" when the setting is disabled

    Scenario: D.106.1000.100 - Enable DRW and check the rule H setting defaults
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named "D.106.1000" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val/Project_redcap_val.xml", and clicking the "Create Project" button

        #VERIFY: The setting is only available when the Data Resolution Workflow is enabled
        Given I click on the link labeled "Setup"
        And I click on the button labeled "Additional customizations"
        Then I should see a checkbox labeled "Prevent calc/CALCTEXT fields with closed/verified data queries from being fixed by DQ rule H (for Data Resolution Workflow only)" that is disabled

        #ACTION: Enable the Data Resolution Workflow (Data Queries)
        When I select "Data Resolution Workflow" in the dropdown field labeled "Enable:"
        Then I should see a checkbox labeled "Prevent calc/CALCTEXT fields with closed/verified data queries from being fixed by DQ rule H (for Data Resolution Workflow only)" that is checked
        # Closed/verified results must stay visible, otherwise rule H shows 0 discrepancies and no "Fix calcs now" button
        And I uncheck the checkbox labeled "Hide closed/verified data queries from Data Quality results (for Data Resolution Workflow only)"
        Then I click on the button labeled "Save"
        Then I should see "The Data Resolution Workflow has now been enabled!"
        And I click on the button labeled "Close"

        #ACTION: Save record 1 so the calculated value (6) is stored - calc values are not imported from the project XML
        Given I click on the link labeled "Record Status Dashboard"
        When I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
        Then I should see "6" in the data entry form field "Calculated Field"
        And I click on the button labeled "Save & Exit Form"

        #ACTION: Change the calculation so the saved value for record 1 (6) is now incorrect
        Given I click on the link labeled "Designer"
        And I click on the link labeled "Data Types"
        And I should see a field named "Calculated Field"
        And I click on the Edit image for the field named "Calculated Field"
        And I enter the equation "3*3" into Calculation Equation of the open "Add New Field" dialog box
        And I click on the button labeled "Save"
        Then I should see "NOTICE: Calculation was changed - Data is affected!"
        And I click on the button labeled "Close"

    Scenario: D.106.1000.200 - Close a data query on the incorrect calculated value
        Given I click on the link labeled "Data Quality"
        And I click on the button labeled "Execute" in the row labeled "Incorrect values for calculated fields"
        When I click on the link labeled "view" in the row labeled "Incorrect values for calculated fields"
        Then I should see "Rule: Incorrect values for calculated fields"
        And I should see "Discrepancies found: 1"
        And I should see 'Calculated value should be "9"'
        And I should see a button labeled "0 comments"

        #ACTION: Open the data query from the discrepancy
        When I click on the button labeled "0 comments"
        Then I should see "Not Opened"
        When I click on the radio labeled "Open query"
        And I enter "Please check the calculated value." into the textarea field labeled "Comment"
        And I click on the button labeled "Open query"
        Then I should see "Saved!"
        And I click on the button labeled "Close"

        #ACTION: Close the data query
        # Reload and re-execute so the comment count is re-rendered (the popup's live count update leaves it blank)
        Given I click on the link labeled "Data Quality"
        And I click on the button labeled "Execute" in the row labeled "Incorrect values for calculated fields"
        When I click on the link labeled "view" in the row labeled "Incorrect values for calculated fields"
        Then I should see "Discrepancies found: 1"
        When I click on the button labeled "1 comment"
        And I click on the radio labeled "Close the query"
        And I enter "Closing the query." into the textarea field labeled "Comment"
        And I click on the button labeled "Close the query"
        Then I should see "Saved!"
        And I click on the button labeled "Close"

    Scenario: D.106.1000.300 - Setting enabled: rule H does not fix the calculated field with a closed query
        Given I click on the link labeled "Data Quality"
        And I click on the button labeled "Execute" in the row labeled "Incorrect values for calculated fields"
        When I click on the link labeled "view" in the row labeled "Incorrect values for calculated fields"
        Then I should see "Discrepancies found: 1"
        And I should see a button labeled "2 comments"
        When I click on the button labeled "Fix calcs now"
        Then I should see "Calculated values fixed!"
        And I should see "0 calculated values were successfully fixed."
        And I click on the button labeled "Close"

        #VERIFY: The incorrect value is still saved
        When I click on the button labeled "Clear"
        And I click on the button labeled "All"
        Then I should see a table header and rows containing the following values in a table:
            | Rule # | Rule Name                              | Rule Logic  (Show discrepancy only if...) | Total Discrepancies |
            | H      | Incorrect values for calculated fields | -                                         | 1                   |

    Scenario: D.106.1000.400 - Setting disabled: rule H fixes the calculated field with a closed query
        Given I click on the link labeled "Setup"
        And I click on the button labeled "Additional customizations"
        And I uncheck the checkbox labeled "Prevent calc/CALCTEXT fields with closed/verified data queries from being fixed by DQ rule H (for Data Resolution Workflow only)"
        Then I click on the button labeled "Save"

        Given I click on the link labeled "Data Quality"
        And I click on the button labeled "Execute" in the row labeled "Incorrect values for calculated fields"
        When I click on the link labeled "view" in the row labeled "Incorrect values for calculated fields"
        Then I should see "Discrepancies found: 1"
        When I click on the button labeled "Fix calcs now"
        Then I should see "Calculated values fixed!"
        And I should see "1 calculated values were successfully fixed."
        And I click on the button labeled "Close"

        #VERIFY: The value is now correct
        When I click on the button labeled "Clear"
        And I click on the button labeled "All"
        Then I should see a table header and rows containing the following values in a table:
            | Rule # | Rule Name                              | Rule Logic  (Show discrepancy only if...) | Total Discrepancies |
            | H      | Incorrect values for calculated fields | -                                         | 0                   |

        Given I click on the link labeled "Record Status Dashboard"
        When I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
        Then I should see "9" in the data entry form field "Calculated Field"

        ##VERIFY_LOG
        When I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design | Make project customizations             |
        And I logout
#END
