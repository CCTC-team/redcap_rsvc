
Feature: D.113.200 - The system shall support the ability to enable/disable Data History Popup for all data collection instruments.

      As a REDCap end user
      I want to see that Data History Popup is functioning as expected

      Scenario: D.113.100 - Data History Popup
            Given I login to REDCap with the user "Test_Admin" 
            And I create a new project named "D.113.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val_fixtures/cdisc_files/Project_redcap_val.xml", and clicking the "Create Project" button

            #ACTION: Enable Data History Popup 
            Given I click on the link labeled "Project Setup"
            And I click on the button labeled "Additional customizations"
            Then I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
            And I click on the button labeled "Cancel" in the dialog box
            
            #VERIFY - Data History Popup entries
            Given I click on the link labeled "Record Status Dashboard"
            And I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
            Then I should see History icon for the field labeled "Name"
            When I click History icon for the field labeled "Name"
            Then I should see a table header and row containing the following values in a table:
                  | Date/Time of Change           | User | Data Changes Made | 
                  | No data exists for this field |      |                   |

            And I click on the button labeled "Close" in the dialog box
            When I enter "John" into the data entry form field labeled "Name" 
            And I click on the button labeled "Save & Stay"
            And I click History icon for the field labeled "Name"
            Then I should see a table header and row containing the following values in a table:
                  | Date/Time of Change | User       | Data Changes Made | 
                  | mm/dd/yyyy hh:mm    | test_admin | John              |

            And I click on the button labeled "Close" in the dialog box
            When I clear field and enter "Joe" into the data entry form field labeled "Name" 
            And I click on the button labeled "Save & Stay"
            And I click on the "History" icon for the field labeled "Name"
            Then I should see a table header and row containing the following values in a table:
                  | Date/Time of Change | User       | Data Changes Made | 
                  | mm/dd/yyyy hh:mm    | test_admin | John              |
                  | mm/dd/yyyy hh:mm    | test_admin | Joe               |

            And I click on the button labeled "Close" in the dialog box

            #ACTION: Disable Data History Popup 
            Given I click on the link labeled "Project Setup"
            And I click on the button labeled "Additional customizations"
            And I uncheck the checkbox labeled "Enable the Data History popup for all data collection instruments?"
            And I click on the button labeled "Save" in the dialog box
            Then I should see "Sucess! Your changes have been saved!"

            #VERIFY - No Data History icon is present
            Given I click on the link labeled "Record Status Dashboard"
            When I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
            Then I should NOT see History icon

            #VERIFY_LOG
            Given I click on the link labeled "Logging"
            Then I should see a table header and row containing the following values in the logging table:
                  | Date / Time      | Username   | Action                                   | List of Data Changes OR Fields Exported |
                  | mm/dd/yyyy hh:mm | test_admin | Manage/Design                            | Make project customizations             |
                  | mm/dd/yyyy hh:mm | test_admin | Update record 1 (Event 1 (Arm 1: Arm 1)) | ptname_v2_v2 = 'Joe'                    |
                  | mm/dd/yyyy hh:mm | test_admin | Update record 1 (Event 1 (Arm 1: Arm 1)) | ptname_v2_v2 = 'John'                   |
      
            And I logout
