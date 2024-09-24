Feature: User Interface: The system shall provide the option to allow blank values to overwrite existing saved values.

  As a REDCap end user
  I want to see that Data import is functioning as expected

  Scenario: B.3.16.1200.100 Data import overwrite existing values with blank

    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "B.3.16.1200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button

    #SETUP_PRODUCTION
    When I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    #M: Will have to accept confirmation window "And I click on the button labeled "Ok" in the pop-up box"
    Then I see Project status: "Production"

    ##VERIFY_RSD:
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "4" and click on the bubble
    Then I should see "Name" in the data entry form field "Name" 
    And I should see "email@test.edu" in the data entry form field "Email" 
    #Need to save the form for 'ignore blank values in the file' to work
    And I click on the button labeled "Save & Exit Form"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Import new data, ignoring blank values
    When I click on the link labeled "Data Import Tool"
    And I select "No, ignore blank values in the file" on the dropdown field labeled " Overwrite data with blank values?"
    And I upload a "csv" format file located at "import_files/B3161200100_ACCURATE.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    
    ##VERIFY
    Then I should see "Your document was uploaded successfully"
    When I click on the button labeled "Import Data"
    Then I should see "Import Successful!"

    #VERIFY_RSD:
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "4" and click on the bubble
    Then I should see "New Name" in the data entry form field "Name" 
    And I should see "email@test.edu" in the data entry form field "Email" 
    And I click on the button labeled "Cancel"

    #FUNCTIONAL REQUIREMENT
    ##ACTION: Import new data, overwrite blank values
    When I click on the link labeled "Data Import Tool"
    And I select "Yes, blank values in the file will overwrite existing values" on the dropdown field labeled "Overwrite data with blank values?"
    And I click on the button labeled "Yes, I understand"
    And I upload a "csv" format file located at "import_files/B3161200100_ACCURATE.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file

    ##VERIFY
    Then I should see "Your document was uploaded successfully"
    When I click on the button labeled "Import Data"
    Then I should see "Import Successful!"

    ##VERIFY_RSD:
    When I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "4" and click on the bubble
    Then I should see "New Name" in the data entry form field "Name"
    And I should see "" in the data entry form field "Email"