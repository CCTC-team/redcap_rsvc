Feature: D.108.100 Smart Variables - The system shall support the ability to use Smart Variables in data entry forms. The following subset of Smart Variables is selected and tested: 
    D.108.100.1 - [event-name]  
    D.108.100.2 - [record-dag-id]  
    D.108.100.3 - [user-role-label] 
    D.108.100.4 - [instrument-name] 
    D.108.100.5 - [user-fullname]   

  As a REDCap end user
  I want to see that smart variables feature is functioning as expected
 
  #Create a user role called 'Data Manager' to test smart variables

  Scenario: 1 D.108.100 - Smart Variable setup

  #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.108.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
        
  #VERIFY: Data Access Group
    When I click on the link labeled "DAGs"
    Then I should see a table header and rows containing the following values in data access groups table:
      | Data Access Groups        | Users in group                                                      | Numbers of records in group|
      | DAG1                      |                                                                     |            0               |
      | [Not assigned to a group] |test admin (Test User), test_user (Test User) *Can view all records  |            1               |

  #ACTION: Add test_user to project D.108.100
    When I click on the link labeled "User Rights"
    And I enter "test_user" into the input field labeled "Add with custom rights"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named "Project Setup & Design"
    And I click on the button labeled "Add User"

  #VERIFY
    Then I should see a table header and rows containing the following values in a table:
      | Role name               | Username                  |
      | —                       | test_admin  (Test User)   |
      | —                       | test_user  (Test User)    |
     
  #ACTION: Assign DAG to test_user
    When I select "test_user (Test User)" on the dropdown field labeled "Assign user"
    And I select "DAG1" on the dropdown field labeled "to"
    And I click on the button labeled "Assign"

  #VERIFY
    Then I should see a table header and rows containing the following values in data access groups table:
      | Data Access Groups        | Users in group                                                      | Numbers of records in group| 
      | DAG1                      |test_user (Test User)                                                |            0               |         
      | [Not assigned to a group] |test admin (Test User),  *Can view all records                       |            1               |

    And I logout

  #ACTION: Login with Test User
    Given I login to REDCap with the user "Test_User"
    When I click on the link labeled "My Projects"  
    And I click on the link labeled "D.108.100" 
    Then I click on the link labeled "Designer"
    And I should see "Data Types"

  Scenario: D.108.100.1 - [event-name]
    When I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Descriptive Text (with optional Image/Video/File Attachment" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "Event Name:[event-name]" into the input field labeled "Field Label" in the dialog box
    And I enter "event_name_desc" into the input field labeled "Variable Name" in the dialog box
    Then I click on the button labeled "Save"

  #VERIFY: [event-name] shows correctly in instrument
    When I click on the link labeled "Add / Edit Records"
    And I click on the link labeled "+ Add new record for the arm selected above"
    Then I should see "Record Home Page"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I should see a field named "Event Name: event_1_arm_1" after field named "Record ID" 
    And I enter "1" into the data entry form field labeled "Required"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    When I should see "Record Home Page"

  Scenario: D.108.100.2 - [record-dag-id] 
    When I click on the link labeled "Designer"
    And I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Descriptive Text (with optional Image/Video/File Attachment" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "Group ID Assigned: [record-dag-id]" into the input field labeled "Field Label" in the dialog box
    And I enter "dag_id" into the input field labeled "Variable Name" in the dialog box
    Then I click on the button labeled "Save"
    
  #VERIFY: [record-dag-id] shows correctly in instrument
    When I click on the link labeled "Add / Edit Records"
    And I select record ID "1-1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
    Then I should see "Record Home Page"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I should see a field named "Group ID Assigned: 1" after field named "Record ID" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record Home Page"
    And I logout

  #FUNCTIONAL_REQUIREMENT
  #ACTION: Create a user role called 'Data Manager'
    Given I login to REDCap with the user "Test_Admin"
    When I click on the link labeled "My Projects"  
    And I click on the link labeled "D.108.100" 
    And I click on the link labeled "User Rights"
    And I enter "Data Manager" into the field with the placeholder text of "Enter new role name"
    And I click on the button labeled "+ Create Role"
    And I check the User Right named "Project Setup & Design"
    And I click on the button labeled "Create role"

  #VERIFY
    Then I should see a table header and rows containing the following values in a table:
      | Role name               | Username                  | Expiration (Click expiration date to edit) | Data Access Group (click DAG to assign user) | 
      | —                       | test_admin  (Test User)   | never                                      |                                              |
      | —                       | test_user  (Test User)    | never                                      |     DAG1                                     |
      | Data Manager            | [No user assigned]        |                                            |                                              | 
      | TestRole                | [No user assigned]        |                                            |                                              |

  #ACTION: Assign Test_User to user role 'Data Manager'
    When I click on the link labeled "test_user(Test User)"
    And I click on the button labeled "Assign to role"
    Then I select "Data Manager" on the dropdown field labeled "Select Role" on the dialog box
    And I click on the button labeled "Assign"
    Then I should see "User 'test_user' has been successfully ASSIGNED to the user role 'Data Manager'"
    
  #VERIFY
    Then I should see a table header and rows containing the following values in a table:
      | Role name               | Username                  | Expiration (Click expiration date to edit) | Data Access Group (click DAG to assign user) | 
      | —                       | test_admin  (Test User)   | never                                      |                                              |
      | Data Manager            | test_user  (Test User)    | never                                      |     DAG1                                     |
      | TestRole                | [No user assigned]        |                                            |                                              |
    And I logout

  #ACTION: Login with Test User
    Given I login to REDCap with the user "Test_User"
    When I click on the link labeled "My Projects"  
    And I click on the link labeled "D.108.100" 
    Then I click on the link labeled "Designer"
    And I should see "Data Types"
    
  Scenario: D.108.100.3 - [user-role-label]
    When I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Descriptive Text (with optional Image/Video/File Attachment" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "User role: [user-role-label]" into the input field labeled "Field Label" in the dialog box
    And I enter "user_role" into the input field labeled "Variable Name" in the dialog box
    Then I click on the button labeled "Save"

  #VERIFY: [user-role-label] shows correctly in instrument
    When I click on the link labeled "Add / Edit Records"
    And I select record ID "1-1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
    Then I should see "Record Home Page"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I should see a field named "User role: Data Manager" after field named "Record ID" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record Home Page"

  Scenario: D.108.100.4 - [instrument-name]
    When I click on the link labeled "Designer"
    And I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Descriptive Text (with optional Image/Video/File Attachment" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "Instrument Name: [instrument-name]" into the input field labeled "Field Label" in the dialog box
    And I enter "instrument_name" into the input field labeled "Variable Name" in the dialog box
    Then I click on the button labeled "Save"

  #VERIFY: [instrument-name] shows correctly in instrument
    When I click on the link labeled "Add / Edit Records"
    And I select record ID "1-1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
    Then I should see "Record Home Page" 
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I should see a field named "Instrument Name: data_types" after field named "Record ID" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record Home Page"

  Scenario: D.108.100.5 [user-fullname]
    When I click on the link labeled "Designer"
    And I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Descriptive Text (with optional Image/Video/File Attachment" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "User Fullname: [user-fullname]" into the input field labeled "Field Label" in the dialog box
    And I enter "user_fullname" into the input field labeled "Variable Name" in the dialog box
    Then I click on the button labeled "Save"

  #VERIFY: [user-fullname] shows correctly in instrument
    When I click on the link labeled "Add / Edit Records"
    And I select record ID "1-1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
    Then I should see "Record Home Page"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I should see a field named "User Fullname: Test User" after field named "Record ID" 
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "Record Home Page"