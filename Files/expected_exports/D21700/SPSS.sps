DATA LIST FREE
	FILE = data1
	/record_id (A1000) redcap_event_name (A500) redcap_repeat_instrument (A500) redcap_repeat_instance (F8) text_validation_complete (F3) 
	ptname (A1000) text2 (A1000) textbox (A1000) notesbox (A30000) calculated_field (F8.2) 
	multiple_dropdown_auto (F3) multiple_dropdown_manual (F3) radio_button_manual (A500) checkbox___1 (F3) checkbox___2 (F3) 
	checkbox___3 (F3) signature (A1000) file_upload (A1000) required (A1000) identifier (A1000) 
	identifier_2 (A1000) edit_field (A1000) data_types_complete (F3).

VARIABLE LEVEL redcap_repeat_instance (SCALE)
	/calculated_field (SCALE).

VARIABLE LABEL record_id 'Record ID'
	/redcap_event_name 'Event Name'
	/redcap_repeat_instrument 'Repeat Instrument'
	/redcap_repeat_instance 'Repeat Instance'
	/text_validation_complete 'Complete?'
	/ptname 'Name'
	/text2 'Text2'
	/textbox 'Text box'
	/notesbox 'Notes box'
	/calculated_field 'Calculated Field'
	/multiple_dropdown_auto 'Multiple Choice dropdown Auto'
	/multiple_dropdown_manual 'Multiple Choice Dropdown Manual'
	/radio_button_manual 'Radio Button Manual'
	/checkbox___1 'Checkbox (choice=Checkbox1)'
	/checkbox___2 'Checkbox (choice=Checkbox2)'
	/checkbox___3 'Checkbox (choice=Checkbox3)'
	/signature 'Signature'
	/file_upload 'File Upload'
	/required 'Required'
	/identifier 'Identifier'
	/identifier_2 'Identifier'
	/edit_field 'Edit Field'
	/data_types_complete 'Complete?'.

VALUE LABELS 
redcap_event_name 'event_1_arm_1' 'Event 1 (Arm 1: Arm 1)' 'event_2_arm_1' 'Event 2 (Arm 1: Arm 1)' 
	'event_three_arm_1' 'Event Three (Arm 1: Arm 1)' 'event_1_arm_2' 'Event 1 (Arm 2: Arm Two)' 
/redcap_repeat_instrument 'data_types' 'Data Types' 
/text_validation_complete '0' 'Incomplete' '1' 'Unverified' 
	'2' 'Complete' 
/multiple_dropdown_auto '1' 'DDChoice1' '2' 'DDChoice2' 
	'3' 'DDChoice3' 
/multiple_dropdown_manual '5' 'DDChoice5' '7' 'DDChoice6' 
	'6' 'DDChoice7' 
/radio_button_manual '9..9' 'Choice99' '100' 'Choice100' 
	'101' 'Choice101' 
/checkbox___1 '0' 'Unchecked' '1' 'Checked' 
/checkbox___2 '0' 'Unchecked' '1' 'Checked' 
/checkbox___3 '0' 'Unchecked' '1' 'Checked' 
/data_types_complete '0' 'Incomplete' '1' 'Unverified' 
	'2' 'Complete'.


SET LOCALE=en_us.
EXECUTE.
