#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
#Setting Labels

label(data$record_id) = "Record ID"
label(data$redcap_event_name) = "Event Name"
label(data$redcap_repeat_instrument) = "Repeat Instrument"
label(data$redcap_repeat_instance) = "Repeat Instance"
label(data$redcap_data_access_group) = "Data Access Group"
label(data$redcap_survey_identifier) = "Survey Identifier"
label(data$name) = "Name"
label(data$email) = "Email"
label(data$text_validation_complete) = "Complete?"
label(data$ptname) = "Name"
label(data$textbox) = "Text box"
label(data$text2) = "Text2"
label(data$radio) = "radio"
label(data$notesbox) = "Notes box"
label(data$multiple_dropdown_manual) = "Multiple Choice Dropdown Manual"
label(data$multiple_dropdown_auto) = "Multiple Choice dropdown Auto"
label(data$multiple_radio_auto) = "Radio Button Auto"
label(data$radio_button_manual) = "Radio Button Manual"
label(data$checkbox___1) = "Checkbox (choice=Checkbox1)"
label(data$checkbox___2) = "Checkbox (choice=Checkbox2)"
label(data$checkbox___3) = "Checkbox (choice=Checkbox3)"
label(data$calc_test) = "Calc Test"
label(data$calculated_field) = "Calculated Field"
label(data$signature) = "Signature"
label(data$file_upload) = "File Upload"
label(data$required) = "Required"
label(data$identifier) = "Identifier"
label(data$identifier_2) = "Identifier"
label(data$edit_field) = "Edit Field"
label(data$date_ymd) = "date YMD"
label(data$date_mdy) = "date MDY"
label(data$date_dmy) = "date DMY"
label(data$time_hhmmss) = "time HH:MM:SS"
label(data$time_hhmm) = "time HH:M"
label(data$time_mmss) = "time MM:SS"
label(data$datetime_ymd_hmss) = "datetime YMD HMSS"
label(data$datetime_ymd_hm) = "datetime YMD HM"
label(data$datetime_mdy_hmss) = "datetime MDY HMSS"
label(data$datetime_dmy_hmss) = "datetime DMY HMSS"
label(data$integer) = "Integer "
label(data$number) = "Numbers"
label(data$number_1_period) = "Numbers 1 decimal place - period as decimal "
label(data$number_1_comma) = "Numbers 1 decimal place - comma as decimal "
label(data$letters) = "Letters only"
label(data$mrn_10_digits) = "MRN (10 Digits)"
label(data$mrn) = "MRN (generic)"
label(data$ssn) = "Social Security Number (US)"
label(data$phone_north_america) = "Phone (North America)"
label(data$phone_australia) = "Phone (Australia)"
label(data$phone_uk) = "Phone (UK)"
label(data$zipcode_us) = "Zipcode (US)"
label(data$postal_5) = "Postal code 5 (France)"
label(data$postal_code_australia) = "Postal Code (Australia)"
label(data$postal_code_canada) = "Postal Code (Canada)"
label(data$data_types_complete) = "Complete?"
label(data$survey_timestamp) = "Survey Timestamp"
label(data$name_survey) = "Name"
label(data$email_survey) = "Email"
label(data$survey_complete) = "Complete?"
label(data$consent_timestamp) = "Survey Timestamp"
label(data$name_consent) = "Name"
label(data$email_consent) = "Email"
label(data$dob) = "DOB"
label(data$signature_consent) = "Signature "
label(data$consent_complete) = "Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
mapping_redcap_event_name = c(
	"event_1_arm_1" = "Event 1 (Arm 1: Arm 1)",
	"event_2_arm_1" = "Event 2 (Arm 1: Arm 1)",
	"event_three_arm_1" = "Event Three (Arm 1: Arm 1)",
	"event_1_arm_2" = "Event 1 (Arm 2: Arm Two)"
)

mapping_redcap_repeat_instrument = c(
	"data_types" = "Data Types"
)

mapping_redcap_data_access_group = c(
	"testgroup1" = "TestGroup1",
	"testgroup2" = "TestGroup2"
)

mapping_text_validation_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)

mapping_radio = c(
	"9..9" = "Choice99",
	"100" = "Choice100",
	"101" = "Choice101"
)

mapping_multiple_dropdown_manual = c(
	"5" = "DDChoice5",
	"7" = "DDChoice6",
	"6" = "DDChoice7"
)

mapping_multiple_dropdown_auto = c(
	"1" = "DDChoice1",
	"2" = "DDChoice2",
	"3" = "DDChoice3"
)

mapping_multiple_radio_auto = c(
	"1" = "Choice1",
	"2" = "Choice2",
	"3" = "Choice.3"
)

mapping_radio_button_manual = c(
	"9..9" = "Choice99",
	"100" = "Choice100",
	"101" = "Choice101"
)

mapping_checkbox___1 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)

mapping_checkbox___2 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)

mapping_checkbox___3 = c(
	"0" = "Unchecked",
	"1" = "Checked"
)

mapping_data_types_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)

mapping_survey_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)

mapping_consent_complete = c(
	"0" = "Incomplete",
	"1" = "Unverified",
	"2" = "Complete"
)

