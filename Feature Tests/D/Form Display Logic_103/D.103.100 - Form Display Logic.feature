Feature: D.103.100 Form Display Logic

  As a REDCap end user
  I want to see that Form Display Logic is functioning as expected

  Scenario: 
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.103.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
    And I click on the link labeled "Designer"
    When I click on the button labeled "Form Display Logic"
    And I select "Data Types [All Events]" on the dropdown field labeled "Keep the following forms enabled..."
    And I enter "[ptname_v2_v2]!=''" into the input field labeled "...when the logic below is TRUE."
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"
    Then I should see "Saved!"

    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record for the arm selected above"
    When I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"
    And I enter "User 2" into the data entry form field labeled "Name"
    And I click on the button labeled "Save & Exit Form"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I enter "2" into the data entry form field labeled "Required"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "Record ID 2 successfully edited."

    Given I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"
    And I clear the field labeled "Name"
    When I click on the button labeled "Save & Exit Form"
    Then I should see "Record ID 2 successfully edited."
    And I cannot click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1" which is greyed out

    Given I click on the link labeled "Designer"
    When I click on the button labeled "Form Display Logic"
    And I check the checkbox labeled "Keep forms enabled if they contain data"
    And I check the checkbox labeled "Hide forms that are disabled"
    And I click on the button labeled "Save"
    Then I should see "Saved!"

    Given I click on the link labeled "Add / Edit Records"
    When I click on the button labeled "Add new record for the arm selected above"
    And I should see "3"  
    Then I should NOT see "Data Types"

    Given I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"
    And I enter "user3" into the input field labeled "Name"
    And I click on the button labeled "Save & Exit Form"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    When I enter "3" into the input field labeled "Required"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "Record ID 3 successfully edited."

    Given I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"
    And I clear the field labeled "Name"
    And I click on the button labeled "Save & Exit Form"
    And I should see "Record ID 3 successfully edited."
    When I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I should see "Text2"
    Then I logout