version 13
clear




label define text_validation_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define multiple_dropdown_auto_ 1 "DDChoice1" 2 "DDChoice2" 3 "DDChoice3" 
label define multiple_dropdown_manual_ 5 "DDChoice5" 7 "DDChoice6" 6 "DDChoice7" 
label define checkbox___1_ 0 "Unchecked" 1 "Checked" 
label define checkbox___2_ 0 "Unchecked" 1 "Checked" 
label define checkbox___3_ 0 "Unchecked" 1 "Checked" 
label define data_types_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label values text_validation_complete text_validation_complete_
label values multiple_dropdown_auto multiple_dropdown_auto_
label values multiple_dropdown_manual multiple_dropdown_manual_
label values checkbox___1 checkbox___1_
label values checkbox___2 checkbox___2_
label values checkbox___3 checkbox___3_
label values data_types_complete data_types_complete_



label variable record_id "Record ID"
label variable redcap_event_name "Event Name"
label variable redcap_repeat_instrument "Repeat Instrument"
label variable redcap_repeat_instance "Repeat Instance"
label variable text_validation_complete "Complete?"
label variable ptname "Name"
label variable text2 "Text2"
label variable textbox "Text box"
label variable notesbox "Notes box"
label variable calculated_field "Calculated Field"
label variable multiple_dropdown_auto "Multiple Choice dropdown Auto"
label variable multiple_dropdown_manual "Multiple Choice Dropdown Manual"
label variable radio_button_manual "Radio Button Manual"
label variable checkbox___1 "Checkbox (choice=Checkbox1)"
label variable checkbox___2 "Checkbox (choice=Checkbox2)"
label variable checkbox___3 "Checkbox (choice=Checkbox3)"
label variable signature "Signature"
label variable file_upload "File Upload"
label variable required "Required"
label variable identifier "Identifier"
label variable identifier_2 "Identifier"
label variable edit_field "Edit Field"
label variable data_types_complete "Complete?"

order record_id redcap_event_name redcap_repeat_instrument redcap_repeat_instance text_validation_complete ptname text2 textbox notesbox calculated_field multiple_dropdown_auto multiple_dropdown_manual radio_button_manual checkbox___1 checkbox___2 checkbox___3 signature file_upload required identifier identifier_2 edit_field data_types_complete 
set more off
describe
