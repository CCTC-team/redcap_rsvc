Feature: Two Factor Authentication: The system shall support enabling/disabling of Two-Factor Authentication.
    

    As a REDCap end user
    I want to see that Two Factor Authentication is functioning as expected

    Scenario: D.101.100 Enabling/Disabling of Two-Factor Authentication
        Given I login to REDCap with the user "Test_User1" 
        Then I should see "Welcome to REDCap"
        And I logout

        Given I login to REDCap with the user "Test_Admin"
        And I click on the link labeled "Control Center"
        And I click on the link labeled "Security & Authentication"
        Then I should see "Security & Authentication Configuration"
        And I should see the dropdown field labeled "Two-Factor Authentication" with the option "Disabled" selected 
        And I should see the dropdown field labeled "Enforce two-factor authentication ONLY for Table-based users?" with the option "No, enforce on all users (Table-based and non-Table-based)" selected
        And I select "Enabled" on the dropdown field labeled "Two-Factor Authentication"
        And I enter "1" into the input field labeled "Authentication interval: Trust a device's two-factor login for X days?"
        Then I click on the button labeled "Save Changes"
        And I should see "Your system configuration values have now been changed!"
        And I logout

    Scenario: D.101.200 Login using Two-Factor Authentication
        # Enter incorrect REDCap Authentication Code
        Given I login to REDCap with the user "Test_User1"
        Then I should see "Two-step verification for REDCap login" in the dialog box
        And I should see a checkbox labeled "Don't prompt me with two-step login on this computer for 24 hours" that is unchecked
        When I click on the radio labeled "Email: Send an email containing your verification code to your email account." in the dialog box
        And I should see "Enter your verification code" in the dialog box
        And I enter "125593" into the input field labeled "Email" in the dialog box
        And I click on the button labeled "Submit" in the dialog box
        Then I should see "Sorry, but you did not enter a valid verification code. Please try again." in the dialog box
        And I click on the button labeled "Close" in the dialog box

        # Copy and paste REDCap Verification code from MailHog
        Given I open Email
        And I click on the latest link labeled "REDCap 2-step login"
        Then I should see "REDCap Verification code"
        And I copy REDCap Verification code

        Given I return to REDCap
        Then I should see "Enter your verification code" in the dialog box
        And I enter REDCap Verification code into the input field labeled "Email" in the dialog box
        And I click on the button labeled "Submit" in the dialog box
        Then I should see "SUCCESS" in the dialog box
        And I should see "Welcome to REDCap"
        And I logout
        
        Given I login to REDCap with the user "Test_User1"
        Then I should see "Two-step verification for REDCap login" in the dialog box
        Then I check the checkbox labeled "Don't prompt me with two-step login on this computer for 24 hours" in the dialog box
        And I click on the radio labeled "Email: Send an email containing your verification code to your email account." in the dialog box
        And I should see "Enter your verification code"

        # Copy and paste REDCap Verification code from MailHog
        Given I open Email
        And I click on the latest link labeled "REDCap 2-step login"
        Then I should see "REDCap Verification code"
        And I copy REDCap Verification code

        Given I return to REDCap
        Then I should see "Enter your verification code" in the dialog box
        And I enter REDCap Verification code into the input field labeled "Email" in the dialog box
        And I click on the button labeled "Submit" in the dialog box
        Then I should see "SUCCESS" in the dialog box
        And I should see "Welcome to REDCap"
        And I logout

        #No verification code asked
        Given I login to REDCap with the user "Test_User1"
        Then I should see "Welcome to REDCap"
        And I logout