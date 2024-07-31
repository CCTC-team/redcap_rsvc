Feature: User Interface: Longitudinal Project Settings: The system shall require administrators to delete events for longitudinal projects while in production

  Scenario: B.4.27.700.100 Admin delete events and arm in Define My Events
  
    ##SETUP
    Given I login to REDCap with the user "Test_Admin"
    When I click on the link labeled "Control Center"
    And I click on the link labeled "User Settings"
    Then I should see "System-level User Settings"
    When I select "Yes, normal users can add/modify events in production" on the dropdown field labeled "Allow normal users to add or modify events and arms on the Define My Events page for longitudinal projects while in production status?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"
    
    And I create a new project named "B.4.27.700.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

    ##SETUP_PRODUCTION
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

    ###USER_RIGHTS
    When I click on the link labeled "User Rights"
    And I enter "Test_User1" into the field with the placeholder text of "Assign new user to role"
    And I click on the button labeled "Assign to role"
    And I select "1_FullRights" on the dropdown field labeled "Select Role" on the role selector dropdown
    And I click on the button labeled exactly "Assign" on the role selector dropdown
    Then I should see "Test User1" within the "1_FullRights" row of the column labeled "Username" of the User Rights table
    Then I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION Verify normal user cannot delete events and arms in production
    Given I login to REDCap with the user "Test_User1"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "B.4.27.700.100"
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Define My Events"
    Then I should see "Arm 1"

    ##VERIFY
    And I should NOT see a link labeled "Delete Arm 1"
    And I should NOT see the Delete image for the event named "Event 1"
    Then I logout

    #FUNCTIONAL REQUIREMENT
    ##ACTION Verify adminitrator can delete events and arms in production
    Given I login to REDCap with the user "Test_Admin"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "B.4.27.700.100"
    When I click on the link labeled "Project Setup"
    And I click on the button labeled "Define My Events"
    Then I should see "Arm 1"
    And I should see "Deleting any events below will result in data loss. Please proceed with caution."

    # ##VERIFY
    When I click on the Delete image for the event named "Event 1" 
    Then I should NOT see "Event 1"
    When I click on the link labeled "Delete Arm 1"
    ##Below steps do not appear in ATS
    # Then I should see "Deleting Arm 1 will also delete ALL events associated with Arm1. Are you sure you wish to do this?"
    # And I click on the button labeled "OK"
    Then I should NOT see "Arm 1"
    Then I logout