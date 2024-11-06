Feature: Send It: D.105.100 - The system shall support the ability to send a file to user/users.

  As a REDCap end user
  I want to see that Send It is functioning as expected

  Scenario: D.105.100 Send a file to user
    Given I login to REDCap with the user "Test_user1" 
    Then I should see "Send-It"
    When I click on the link labeled "Send-It"
    Then I should see the dropdown field labeled "From:" with the option "Test_User1@test.edu" selected
    When I enter "joe@abc.com, paul@abc.com" into the input field labeled "To:"
    And I enter "Send-it file" into the input field labeled "Email subject:"
    And I enter "Send-it csv file" into the input field labeled "Email message:"
    #The file will expire and become inaccessible after 2 days
    And I select "2 days" on the dropdown field labeled "Expiration:"
    Then I click the button labeled "Choose file" to select and upload the file located at "/import_files/B.3.16.600_DataImport.csv"
    And I click on the button labeled "Send It!"
    Then I should see "File successfully uploaded!"

    # Verify Email for joe@abc.com
    # Email sent with Password
    Given I open Email
    When I click on the link labeled "Re: [REDCap Send-It] Send-it file" for user "joe@abc.com"
    Then I should see "joe@abc.com"
    And I should see "Below is the password for downloading the file mentioned in the previous email."
    And I copy Password
     
    # Email sent with download link
    Given I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file" for user "joe@abc.com"
    Then I should see "joe@abc.com"
    And I should see 'Test User1 has uploaded the file "B.3.16.600_DataImport.csv" for you to download.'
    When I click on the link containing "SendItController"
    Then I should see "File Download"
    And I enter Password into the input field labeled "Enter password"
    And I download a file by clicking on the link labeled "Download File"
    Then I should see "SUCCESS! The file will begin downloading momentarily."

    # Verify Email for paul@abc.com
    # Email sent with Password
    Given I click on the link labeled "Inbox"
    When I click on the link labeled "Re: [REDCap Send-It] Send-it file" for user "paul@abc.com"
    Then I should see "paul@abc.com"
    And I should see "Below is the password for downloading the file mentioned in the previous email."
    And I copy Password
     
    # Email sent with download link
    Given I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file" for user "paul@abc.com"
    Then I should see "paul@abc.com"
    And I should see 'Test User1 has uploaded the file "B.3.16.600_DataImport.csv" for you to download.'
    When I click on the link containing "SendItController"
    Then I should see "File Download"
    And I enter Password into the input field labeled "Enter password"
    And I download a file by clicking on the link labeled "Download File"
    Then I should see "SUCCESS! The file will begin downloading momentarily."
    And I logout    