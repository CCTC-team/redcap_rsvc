/* Edit the following line to reflect the full path to your CSV file */

OPTIONS nofmterr;

proc format;
	value $redcap_event_name_ 'event_1_arm_1'='Event 1 (Arm 1: Arm 1)' 'event_2_arm_1'='Event 2 (Arm 1: Arm 1)' 
		'event_three_arm_1'='Event Three (Arm 1: Arm 1)' 'event_1_arm_2'='Event 1 (Arm 2: Arm Two)';
	value $redcap_repeat_instrument_ 'data_types'='Data Types';
	value text_validation_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';
	value multiple_dropdown_auto_ 1='DDChoice1' 2='DDChoice2' 
		3='DDChoice3';
	value multiple_dropdown_manual_ 5='DDChoice5' 7='DDChoice6' 
		6='DDChoice7';
	value $radio_button_manual_ '9..9'='Choice99' '100'='Choice100' 
		'101'='Choice101';
	value checkbox___1_ 0='Unchecked' 1='Checked';
	value checkbox___2_ 0='Unchecked' 1='Checked';
	value checkbox___3_ 0='Unchecked' 1='Checked';
	value data_types_complete_ 0='Incomplete' 1='Unverified' 
		2='Complete';

	run;

data work.redcap; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat record_id $500. ;
	informat redcap_event_name $500. ;
	informat redcap_repeat_instrument $500. ;
	informat redcap_repeat_instance best32. ;
	informat text_validation_complete best32. ;
	informat ptname $500. ;
	informat text2 $500. ;
	informat textbox $500. ;
	informat notesbox $5000. ;
	informat calculated_field best32. ;
	informat multiple_dropdown_auto best32. ;
	informat multiple_dropdown_manual best32. ;
	informat radio_button_manual $500. ;
	informat checkbox___1 best32. ;
	informat checkbox___2 best32. ;
	informat checkbox___3 best32. ;
	informat signature $500. ;
	informat file_upload $500. ;
	informat required $500. ;
	informat identifier $500. ;
	informat identifier_2 $500. ;
	informat edit_field $500. ;
	informat data_types_complete best32. ;

	format record_id $500. ;
	format redcap_event_name $500. ;
	format redcap_repeat_instrument $500. ;
	format redcap_repeat_instance best12. ;
	format text_validation_complete best12. ;
	format ptname $500. ;
	format text2 $500. ;
	format textbox $500. ;
	format notesbox $5000. ;
	format calculated_field best12. ;
	format multiple_dropdown_auto best12. ;
	format multiple_dropdown_manual best12. ;
	format radio_button_manual $500. ;
	format checkbox___1 best12. ;
	format checkbox___2 best12. ;
	format checkbox___3 best12. ;
	format signature $500. ;
	format file_upload $500. ;
	format required $500. ;
	format identifier $500. ;
	format identifier_2 $500. ;
	format edit_field $500. ;
	format data_types_complete best12. ;

input
	record_id $
	redcap_event_name $
	redcap_repeat_instrument $
	redcap_repeat_instance
	text_validation_complete
	ptname $
	text2 $
	textbox $
	notesbox $
	calculated_field
	multiple_dropdown_auto
	multiple_dropdown_manual
	radio_button_manual $
	checkbox___1
	checkbox___2
	checkbox___3
	signature $
	file_upload $
	required $
	identifier $
	identifier_2 $
	edit_field $
	data_types_complete
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

proc contents;run;

data redcap;
	set redcap;
	label record_id='Record ID';
	label redcap_event_name='Event Name';
	label redcap_repeat_instrument='Repeat Instrument';
	label redcap_repeat_instance='Repeat Instance';
	label text_validation_complete='Complete?';
	label ptname='Name';
	label text2='Text2';
	label textbox='Text box';
	label notesbox='Notes box';
	label calculated_field='Calculated Field';
	label multiple_dropdown_auto='Multiple Choice dropdown Auto';
	label multiple_dropdown_manual='Multiple Choice Dropdown Manual';
	label radio_button_manual='Radio Button Manual';
	label checkbox___1='Checkbox (choice=Checkbox1)';
	label checkbox___2='Checkbox (choice=Checkbox2)';
	label checkbox___3='Checkbox (choice=Checkbox3)';
	label signature='Signature';
	label file_upload='File Upload';
	label required='Required';
	label identifier='Identifier';
	label identifier_2='Identifier';
	label edit_field='Edit Field';
	label data_types_complete='Complete?';
	format redcap_event_name redcap_event_name_.;
	format redcap_repeat_instrument redcap_repeat_instrument_.;
	format text_validation_complete text_validation_complete_.;
	format multiple_dropdown_auto multiple_dropdown_auto_.;
	format multiple_dropdown_manual multiple_dropdown_manual_.;
	format radio_button_manual radio_button_manual_.;
	format checkbox___1 checkbox___1_.;
	format checkbox___2 checkbox___2_.;
	format checkbox___3 checkbox___3_.;
	format data_types_complete data_types_complete_.;
run;

proc contents data=redcap;
proc print data=redcap;
run;
