Feature: Send It: D.105.200 - The system shall support the ability to receive email confirmation of file download from the user/users.

  As a REDCap end user
  I want to see that Send It is functioning as expected

  Scenario: D.105.200 - Received Email Confirmation
    Given I login to REDCap with the user "Test_user1" 
    And I should see "Send-It"
    When I click on the link labeled "Send-It"
    Then I should see the dropdown field labeled "From:" with the option "Test_User1@test.edu" selected
    And I enter "dave@abc.com" into the input field labeled "To:"
    And I enter "Send-it file2" into the input field labeled "Email subject:"
    And I enter "Send-it csv file2" into the input field labeled "Email message:"
    #The file will expire and become inaccessible after 1 day
    And I select "1 day" on the dropdown field labeled "Expiration:"
    Then I click the button labeled "Choose file" to select and upload the file located at "/import_files/B.3.16.600_DataImport.csv"
    And I check the checkbox labeled "Receive Confirmation?"
    And I click on the button labeled "Send It!"
    Then I should see "File successfully uploaded!"
    
    # Email sent with Password
    Given I open Email
    When I click on the link labeled "Re: [REDCap Send-It] Send-it file2" for user "dave@abc.com"
    Then I should see "dave@abc.com"
    And I should see "Re: [REDCap Send-It] Send-it file2"
    And I should see "Below is the password for downloading the file mentioned in the previous email."
    And I copy Password
     
    # Email sent with download link
    Given I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file2" for user "dave@abc.com"
    Then I should see "dave@abc.com"
    And I should see "[REDCap Send-It] Send-it file2"
    And I should see 'Test User1 has uploaded the file "B.3.16.600_DataImport.csv" for you to download.'
    When I click on the link containing "SendItController"
    Then I should see "File Download"
    And I enter Password into the input field labeled "Enter password:"
    And I download a file by clicking on the link labeled "Download File"
    Then I should see "SUCCESS! The file will begin downloading momentarily."

    ##VERIFY: Verify Email Confirmation is Received
    Given I open Email
    When I click on the link labeled "[REDCap Send-It] Confirmation of file download"
    Then I should see 'The file you uploaded, "B.3.16.600_DataImport.csv" (0.01 MB), was downloaded by dave@abc.com'

  Scenario: D.105.300 Expiration Time
    # Email expired after the expiration day (1 day)
    Given I open Email
    And I click on the link labeled "[REDCap Send-It] Send-it file2" for user "dave@abc.com"
    Then I should see "dave@abc.com"
    And I should see "[REDCap Send-It] Send-it file2"
    And I should see 'Test User1 has uploaded the file "B.3.16.600_DataImport.csv" for you to download.'
    When I click on the link containing "SendItController"
    Then I should see "The file has expired."
    And I logout