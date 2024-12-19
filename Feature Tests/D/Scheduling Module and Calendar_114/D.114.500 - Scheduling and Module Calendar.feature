Feature: D.114.300 Printing and Importing Calendar Events

Scenario:  The system shall support the ability to print or import calendar to outlook
    Given I click on the link labeled "Print Calendar"
    Then I print the page
    #above definition is not how i would word it but it is used elsewhere so keeps it the same

    Given I click on the button labeled "Sync Calendar to External Application" 
    When I click on the button labeled "Download ICS File"
    And I open the file on the computer???? 
    Then Outlook application will run the file and update calendar with events
    # above 2 are obviously wrong but this is now well outside redcap_cypress