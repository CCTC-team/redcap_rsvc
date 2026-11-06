# Feature file changes since 14 October 2026

Changes to `.feature` files on `redcap_val` in `CCTC-team/redcap_rsvc`, comparing `c853b28b` (the last commit before 14 Oct) with `293348b6` (the tip on 6 Nov 2026). The file count went from 309 to 326.

"rsvc" means Vanderbilt's `vanderbilt-redcap/redcap_rsvc`, which reaches us through sync PRs #1 (16 Oct) and #19 (29 Oct). "Ours" means CCTC, including everything in folder `D/`. Paths are relative to `Feature Tests/`.

## Summary

| Change | rsvc | Ours | Total |
|---|---:|---:|---:|
| New | 22 | 1 | 23 |
| Modified | 144 | 72 | 216 |
| Removed | 2 | 4 | 6 |

Two more `D/` files were renamed with no content change, and 83 files were unchanged.

## How to read these counts

- **Counted by arrival in our repo, not by when Vanderbilt wrote the change.** Our previous common point with rsvc was January 2026, so PR #1 brought in about 9 months of their work. Only 7 of the 22 new rsvc files were first added upstream after 14 Oct.
- **Two new rsvc files replace two removed ones.** `B.3.16.1600` and `B.3.16.1700` became `REDUNDANT` stubs, so rsvc added 20 genuinely new features and no numbering was lost.
- **Our modified count overstates the rework.** Of the 71 `D/` files, 38 changed steps and 33 changed only Feature/Scenario title lines, mostly the 4-digit ID rename.
- **Files are counted, not scenarios.** The uncommitted `D.103.0400` draft is not included.

## New

### Ours (1)

- `D/Data Resolution Workflow_106/D.106.1000. - DRW Prevent Rule H Fixing Closed Queries.feature`

### rsvc (22)

| First added upstream | File |
|---|---|
| 2026-01-29 | `C/Record Locking & E-Signatures_19/C.2.19.1500. - Record Locking Customization settings as part of a Project XML file.feature` |
| 2026-05-21 | `A/eDoc_28/A.3.28.1600. - Restricted Upload MIME Validation.feature` |
| 2026-05-21 | `B/Assign User Rights_6/B.2.6.0600. - Instrument level delete privileges.feature` |
| 2026-08-14 | `B/Online Designer_7/B.6.7.2200. - User Interface - Online Designer - Field Creation - Variable Name Validation.feature` |
| 2026-08-17 | `B/Online Designer_7/B.6.7.2100. - Enhanced Signature.feature` |
| 2026-08-26 | `A/User Settings_6/A.2.6.0700. - Adding user to project.feature` |
| 2026-08-26 | `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.1300. - Retaining user preferences for record search, navigation, and arm selection.feature` |
| 2026-08-26 | `B/Online Designer_7/B.6.7.2300. - Dynamic SQL Field Creation.feature` |
| 2026-09-01 | `B/Data Import_16/B.3.16.1600. - REDUNDANT.feature` |
| 2026-09-01 | `B/Data Import_16/B.3.16.1700. - REDUNDANT.feature` |
| 2026-09-18 | `C/File Repository_26/C.3.26.1100. - Project Settings – File Repository.feature` |
| 2026-09-18 | `C/Randomization_30/C.3.30.1900. - Randomization dashboard export.feature` |
| 2026-10-05 | `C/Data Quality_18/C.4.18.1600. - Data Resolution Workflow user privileges.feature` |
| 2026-10-09 | `C/Data Quality_18/C.4.18.1700. - Data Resolution Workflow Query Lifecycle.feature` |
| 2026-10-09 | `C/Data Quality_18/C.4.18.1800. - Data Resolution Workflow Data Quality Results.feature` |
| 2026-10-21 | `C/Data Quality_18/C.4.18.1500. - User Interface field comment and query management.feature` |
| 2026-10-22 | `C/Data Quality_18/C.4.18.1900. - The system shall support centralized review and management of data queries within the Data Resolution Workflow.feature` |
| 2026-10-22 | `C/Data Quality_18/C.4.18.2000. - Data Resolution Workflow Assign and Reassign Queries.feature` |
| 2026-10-23 | `C/Data Quality_18/C.4.18.2200. - Exporting Data Quality Discrepencies.feature` |
| 2026-10-23 | `C/Data Quality_18/C.4.18.2300. - Data Resolution Workflow Assignment Notifications.feature` |
| 2026-10-23 | `C/Data Quality_18/C.4.18.2400. - Data Resolution Workflow File Deletion.feature` |
| 2026-10-27 | `C/Data Quality_18/C.4.18.2100. - Data Resolution Workflow Attachment Upload Configuration.feature` |

## Removed

### Ours (4)

| PR | File |
|---|---|
| #10 | `A/Bulk Record Delete_32/A.3.32.0100. - Bulk Record Delete.feature` |
| #6 | `B/Bulk Record Delete_32/B.3.32.0200. - Bulk Record Delete.feature` |
| #18 | `C/Record Locking & E-Signatures_19/C.2.19.1200. - REDUNDANT.Pin session.feature` |
| #18 | `C/Record Locking & E-Signatures_19/C.2.19.1400. - REDUNDANT.record_locking_external_storage.feature` |

### rsvc (2)

Both were replaced by `REDUNDANT` stubs with the same IDs.

- `B/Data Import_16/B.3.16.1600. - Background erorr report.feature`
- `B/Data Import_16/B.3.16.1700. - export error report.feature`

## Modified

### Ours (72)

The `D/` files also moved from 3-digit to 4-digit IDs where the previous name is shown.

| File | Previous name | What changed |
|---|---|---|
| `B/Project Setup_4/B.6.4.1100. - Erase data in Development Mode.feature` | – | Steps |
| `D/Action Tags_107/D.107.0100. - Action Tags.feature` | `D.107.100 - Action Tags.feature` | Steps |
| `D/Additional Customizations_113/D.113.0100. - Missing Code.feature` | `D.113.100 - Missing Code.feature` | Steps |
| `D/Additional Customizations_113/D.113.0200. - Data History Popup.feature` | `D.113.200 - Data History Popup.feature` | Steps |
| `D/Additional Customizations_113/D.113.0300. - Branching Logic Hiding Fields.feature` | `D.113.300 - Branching Logic Hiding Fields.feature` | Steps |
| `D/Additional Customizations_113/D.113.0400. - Reason For Change.feature` | `D.113.400 - Reason For Change.feature` | Steps |
| `D/Alerts and Notifications_102/D.102.0100. - Alerts and Notification.feature` | `D.102.100 - Alerts and Notification.feature` | Steps |
| `D/Alerts and Notifications_102/D.102.0200. - REDUNDANT.feature` | `D.102.200 - REDUNDANT.feature` | Title lines only |
| `D/Alerts and Notifications_102/D.102.0300. - Alerts Based on Conditional Logic.feature` | `D.102.300 - Alerts Based on Conditional Logic.feature` | Steps |
| `D/Alerts and Notifications_102/D.102.0400. - Alerts Based on Conditional Logic During Import.feature` | `D.102.400 - Alerts Based on Conditional Logic During Import.feature` | Title lines only |
| `D/Alerts and Notifications_102/D.102.0500. - REDUNDANT.feature` | `D.102.500 - REDUNDANT.feature` | Title lines only |
| `D/Alerts and Notifications_102/D.102.0600. - REDUNDANT.feature` | `D.102.600 - REDUNDANT.feature` | Title lines only |
| `D/Automated Survey Invitations_104/D.104.0100. - Send Survey When Logic is True.feature` | `D.104.100 - Send Survey When Logic is True.feature` | Steps |
| `D/Automated Survey Invitations_104/D.104.0200. - REDUNDANT.feature` | `D.104.200 - REDUNDANT.feature` | Title lines only |
| `D/Automated Survey Invitations_104/D.104.0300. - Send When Logic is True and Survey Complete.feature` | `D.104.300 - Send When Logic is True and Survey Complete.feature` | Steps |
| `D/Automated Survey Invitations_104/D.104.0400. - REDUNDANT.feature` | `D.104.400 - REDUNDANT.feature` | Title lines only |
| `D/Automated Survey Invitations_104/D.104.0500. - REDUNDANT.feature` | `D.104.500 - REDUNDANT.feature` | Title lines only |
| `D/Automated Survey Invitations_104/D.104.0600. - REDUNDANT.feature` | `D.104.600 - REDUNDANT.feature` | Title lines only |
| `D/Automated Survey Invitations_104/D.104.0700. - REDUNDANT.feature` | `D.104.700 - REDUNDANT.feature` | Title lines only |
| `D/Branching Logic_9/D.9.0200. - Branching Logc with Repeating Instrument and Events.feature` | `D.9.200 - Branching Logc with Repeating Instrument and Events.feature` | Steps |
| `D/Codebook_111/D.111.0100. - Codebook.feature` | `D.111.100 - Codebook.feature` | Steps |
| `D/Codebook_111/D.111.0200. - REDUNDANT.feature` | `D.111.200 - REDUNDANT.feature` | Title lines only |
| `D/Concurrent Users_129/D.129.0100. - Concurrent users.feature` | `D.129.100 - Concurrent users.feature` | Steps |
| `D/Concurrent Users_129/D.129.0200. - REDUNDANT.feature` | `D.129.200 - REDUNDANT.feature` | Title lines only |
| `D/Data Access Groups_10/D.10.0700. - Reassign record to another DAG.feature` | `D.10.700 - Reassign record to another DAG.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0100. - DRW User Rights.feature` | `D.106.100 - DRW User Rights.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0200. - DRW Open Close Respond to Queries.feature` | `D.106.200 - DRW Open Close Respond to Queries.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0300. - REDUNDANT.feature` | `D.106.300 - REDUNDANT.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0400. - REDUNDANT.feature` | `D.106.400 - REDUNDANT.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0500. - REDUNDANT.feature` | `D.106.500 - REDUNDANT.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0600. - DRW Verify and De-verify Data.feature` | `D.106.600 - DRW Verify and De-verify Data.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0700. - REDUNDANT.feature` | `D.106.700 - REDUNDANT.feature` | Title lines only |
| `D/Data Resolution Workflow_106/D.106.0800. - DRW Field Comments.feature` | `D.106.800 - DRW Field Comments.feature` | Steps |
| `D/Data Resolution Workflow_106/D.106.0900. - REDUNDANT.feature` | `D.106.900 - REDUNDANT.feature` | Title lines only |
| `D/Download PDF of Instruments_115/D.115.0100. - Download PDF of Instruments.feature` | `D.115.100 - Download PDF of Instruments.feature` | Title lines only |
| `D/Download PDF of Instruments_115/D.115.0200. - Customization of PDF Instruments.feature` | `D.115.200 - Customization of PDF Instruments.feature.feature` | Title lines only |
| `D/Download PDF of Instruments_115/D.115.0300. - Download PDF of Instruments with Record Data.feature` | `D.115.300 - Download PDF of Instruments with Record Data.feature.feature` | Steps |
| `D/Download PDF of Instruments_115/D.115.0400. - Download PDF of Instruments with Record Data Compact.feature` | `D.115.400 - Download PDF of Instruments with Record Data Compact.feature` | Steps |
| `D/Download PDF of Instruments_115/D.115.0500. - Download PDF of Data Entry Form.feature` | `D.115.500 - Download PDF of Data Entry Form.feature` | Title lines only |
| `D/Download PDF of Instruments_115/D.115.0600. - Download PDF of Instruments of All Records.feature` | `D.115.600 - Download PDF of Instruments of All Records.feature` | Steps |
| `D/Download PDF of Instruments_115/D.115.0700. - Download PDF of Instruments of All Records Compact.feature` | `D.115.700 - Download PDF of Instruments of All Records Compact.feature` | Steps |
| `D/Downloading Metadata_119/D.119.0100. - Downloading metadata.feature` | `D.119.100 - Downloading metadata.feature` | Steps |
| `D/Downloading Metadata_119/D.119.0200. - Downloading metadata and data.feature` | `D.119.200 - Downloading metadata and data.feature` | Steps |
| `D/Draft Mode_20/D.4.20.0200. - Draft Mode confirmation email.feature` | `D.4.20.1000 - Draft Mode confirmation email.feature` | Steps |
| `D/Export_21/D.21.0700. - Verify Export File Formats.feature` | `D.21.700 - Verify Export File Formats.feature` | Steps |
| `D/Field Embedding_120/D.120.0100. - Field Embedding.feature` | `D.120.100 - Field Embedding.feature` | Title lines only |
| `D/File Version History for File Upload Fields_117/D.117.0100. - File Version History for File Upload fields.feature` | `D.117.100 - File Version History for File Upload fields.feature` | Steps |
| `D/File Version History for File Upload Fields_117/D.117.0200. - REDUNDANT.feature` | `D.117.200 - REDUNDANT.feature` | Title lines only |
| `D/File Version History for File Upload Fields_117/D.117.0300. - REDUNDANT.feature` | `D.117.300 - REDUNDANT.feature` | Title lines only |
| `D/File Version History for File Upload Fields_117/D.117.0400. - REDUNDANT.feature` | `D.117.400 - REDUNDANT.feature` | Title lines only |
| `D/Form Display Logic_103/D.103.0100. - Form Display Logic.feature` | `D.103.100 - Form Display Logic.feature` | Steps |
| `D/Form Display Logic_103/D.103.0200. - REDUNDANT.feature` | `D.103.200 - REDUNDANT.feature` | Title lines only |
| `D/Form Display Logic_103/D.103.0300. - REDUNDANT.feature` | `D.103.300 - REDUNDANT.feature` | Title lines only |
| `D/Organise Stored Files By Subfolders_121/D.121.0100. - Organize stored files into subfolders.feature` | `D.121.100 - Organize stored files into subfolders.feature` | Steps |
| `D/Piping_109/D.109.0100. - Piping.feature` | `D.109.100 - Piping.feature` | Steps |
| `D/Reporting_22/D.5.22.0300. - Limit Fields Included in a Report.feature` | `D.5.22.300 - Limit Fields Included in a Report.feature` | Steps |
| `D/Reporting_22/D.5.22.0400. - REDUNDANT.feature` | `D.5.22.400 - REDUNDANT.feature` | Title lines only |
| `D/Reporting_22/D.5.22.0500. - REDUNDANT.feature` | `D.5.22.500 - REDUNDANT.feature` | Title lines only |
| `D/Scheduling Module and Calendar_114/D.114.0100. - Scheduling Module and Calendar.feature` | `D.114.100 - Scheduling Module and Calendar.feature` | Steps |
| `D/Secondary Unique Field_116/D.116.0100. - Secondary Unique Field.feature` | `D.116.100 - Secondary Unique Field.feature` | Steps |
| `D/Secondary Unique Field_116/D.116.0200. - REDUNDANT.feature` | `D.116.200 - REDUNDANT.feature` | Title lines only |
| `D/Secondary Unique Field_116/D.116.0300. - REDUNDANT.feature` | `D.116.300 - REDUNDANT.feature` | Title lines only |
| `D/Secondary Unique Field_116/D.116.0400. - REDUNDANT.feature` | `D.116.400 - REDUNDANT.feature` | Title lines only |
| `D/Send It_105/D.105.0100. - Send File To User.feature` | `D.105.100 - Send File To User.feature` | Title lines only |
| `D/Send It_105/D.105.0200. - Receive Email Confirmation.feature` | `D.105.200 - Receive Email Confirmation.feature` | Title lines only |
| `D/Smart Variables_108/D.108.0100. - Smart Variables.feature` | `D.108.100 - Smart Variables.feature` | Steps |
| `D/Special Functions_110/D.110.0100. - Special Functions.feature` | `D.110.100 - Special Functions.feature` | Steps |
| `D/Stats and Charts_118/D.118.0100. - Stats and Charts.feature` | `D.118.100 - Stats and Charts.feature` | Steps |
| `D/Two Factor Authentication_101/D.101.0100. - Two Factor Authentication.feature` | `D.101.100 - Two Factor Authentication.feature` | Title lines only |
| `D/Two Factor Authentication_101/D.101.0200. - REDUNDANT.feature` | `D.101.200 - REDUNDANT.feature` | Title lines only |
| `D/Two Factor Authentication_101/D.101.0300. - REDUNDANT.feature` | `D.101.300 - REDUNDANT.feature` | Title lines only |
| `D/User Password Strategy_112/D.112.0100. - User Password Strategy.feature` | `D.112.100 - User Password Strategy.feature` | Title lines only |

### rsvc, our copy differs from theirs (50)

Vanderbilt changed these files, but our version still differs from what they shipped. The 4 marked "Yes" were also edited by our own PRs after a sync. The other 46 changed only in the sync PRs, so their differences could be older CCTC edits or merge resolutions.

| File | Edited by our PRs after sync |
|---|---|
| `A/Project Setup_4/A.6.4.0500. - Repeatable Instruments.feature` | – |
| `A/Project Setup_4/A.6.4.0600. - Events and Arms in Production.feature` | – |
| `A/Project Setup_4/A.6.4.1600. - Edit Survey Responses.feature` | Yes |
| `A/eDoc_28/A.3.28.0500. - eDoc File Attachments.feature` | – |
| `B/Assign User Rights_6/B.2.6.0200. - Data Entry Form Access.feature` | Yes |
| `B/Assign User Rights_6/B.2.6.0300. - Data Export Rights.feature` | – |
| `B/Assign User Rights_6/B.2.6.0500. - Adding and Removing Users from Roles.feature` | – |
| `B/Branching Logic_9/B.4.9.0100. - Branching Logic.feature` | – |
| `B/Data Access Groups_10/B.2.10.0100. - Create Edit Delete.feature` | – |
| `B/Data Access Groups_10/B.2.10.0200. - Add Remove Users.feature` | – |
| `B/Data Access Groups_10/B.2.10.0300. - Multiple DAGs.feature` | – |
| `B/Data Access Groups_10/B.2.10.0400. - User and Record Restrictions.feature` | – |
| `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0400. - Datetime Fields.feature` | – |
| `B/Direct Data Entry - Survey_15/B.3.15.0100. - Enable Instrument as Survey.feature` | – |
| `B/Direct Data Entry - Survey_15/B.3.15.0200. - Survey Status.feature` | – |
| `B/Direct Data Entry - Survey_15/B.3.15.0400. - Open Survey from Form.feature` | – |
| `B/Export Data_21/B.5.21.0100. - Export PHI.feature` | Yes |
| `B/Field Validation_8/B.4.8.0200. - Text Validation.feature` | – |
| `B/Field Validation_8/B.4.8.0300. - Field Ranges.feature` | – |
| `B/Project Setup_4/B.6.4.1400. - Repeating Surveys.feature` | – |
| `C/Data Quality_18/C.4.18.0200. - Data Quality create rules.feature` | Yes |
| `C/File Repository_26/C.3.26.0200. - View Access & User Rights.feature` | – |
| `C/Randomization_30/C.3.30.0600. - Randomization DAG.feature` | – |
| `C/Randomization_30/C.3.30.0700. - Randomization create.feature` | – |
| `C/Randomization_30/C.3.30.0800. - Randomization automatic.feature` | – |
| `C/Randomization_30/C.3.30.0900. - Randomization lock.feature` | – |
| `C/Randomization_30/C.3.30.1000. - Randomization assignment.feature` | – |
| `C/Randomization_30/C.3.30.1200. - Randomization audit trail.feature` | – |
| `C/Randomization_30/C.3.30.1800. - Randomization Admin actions.feature` | – |
| `C/Record Locking & E-Signatures_19/C.2.19.0900. - eSign and Lock access.feature` | – |
| `C/e-Consent framework_24/C.3.24.0105. - eConsent enable.feature` | – |
| `C/e-Consent framework_24/C.3.24.0205. - eConsent footer.feature` | – |
| `C/e-Consent framework_24/C.3.24.0305. - eConsent status.feature` | – |
| `C/e-Consent framework_24/C.3.24.0405. - eConsent goverend snapshot.feature` | – |
| `C/e-Consent framework_24/C.3.24.0505. - eConsent download PDF.feature` | – |
| `C/e-Consent framework_24/C.3.24.0605. - eConsent edit.feature` | – |
| `C/e-Consent framework_24/C.3.24.0705. - eConsent Certification Page.feature` | – |
| `C/e-Consent framework_24/C.3.24.0805. - eConsent repeat.feature` | – |
| `C/e-Consent framework_24/C.3.24.1200. - eConsent header.feature` | – |
| `C/e-Consent framework_24/C.3.24.1300. - eConsent filename.feature` | – |
| `C/e-Consent framework_24/C.3.24.1500. - eConsent version control.feature` | – |
| `C/e-Consent framework_24/C.3.24.1700. - eConsent DAG.feature` | – |
| `C/e-Consent framework_24/C.3.24.1900. - eConsent autosave PDF.feature` | – |
| `C/e-Consent framework_24/C.3.24.2000. - eConsent display.feature` | – |
| `C/e-Consent framework_24/C.3.24.2200. - PDF triggers.feature` | – |
| `C/e-Consent framework_24/C.3.24.2300. - PDF display.feature` | – |
| `C/e-Consent framework_24/C.3.24.2500. - PDF conditional logic.feature` | – |
| `C/e-Consent framework_24/C.3.24.2600. - PDF multi.feature` | – |
| `C/e-Consent framework_24/C.3.24.2800. - PDF filename.feature` | – |
| `C/e-Consent framework_24/C.3.24.2900. - eConsent PDF logging.feature` | – |

### rsvc, identical to theirs (94)

- `A/Add Manage Users_2/A.2.2.0200. - Suspend - Unsuspend.feature`
- `A/Add Manage Users_2/A.2.2.0400. - Delete.feature`
- `A/Add Manage Users_2/A.2.2.0600. - Account Lockout.feature`
- `A/Add Manage Users_2/A.2.2.0700. - Account Lockout Time Change.feature`
- `A/Add Manage Users_2/A.2.2.0800. - Auto-Logout Inactivity Time.feature`
- `A/Assign Administrators_3/A.2.3.0100. - REDUNDANT Administrators Table.feature`
- `A/Assign Administrators_3/A.2.3.0200. - Add Remove Admins.feature`
- `A/Assign Administrators_3/A.2.3.0300. - Super Users and Account Managers.feature`
- `A/Field Validation_8/A.4.8.0100. - Enable field validation.feature`
- `A/Project Setup_4/A.6.4.0200. - Move to Production.feature`
- `A/Project Setup_4/A.6.4.0300. - REDUNDANT Edit Survey Responses.feature`
- `A/Project Setup_4/A.6.4.0400. - Draft Mode.feature`
- `A/Project Status_11/A.6.11.0500. -  Restrict the Number of Test Records.feature`
- `A/e-Consent framework_24/A.3.24.1100. - eConsent custom message.feature`
- `A/e-Consent framework_24/A.3.24.3000. - eConsent PL edit.feature`
- `A/eDoc_28/A.3.28.0300. - eDoc File Upload.feature`
- `A/eDoc_28/A.3.28.0400. - eDoc Send-It Upload Configuration.feature`
- `A/eDoc_28/A.3.28.0900. - REDUNDANT.External Store Send-It.feature`
- `B/Assign User Rights_6/B.2.6.0100. - Basic Privileges.feature`
- `B/Assign User Rights_6/B.2.6.0400. - Creating Copying Deleting Roles.feature`
- `B/Data Access Groups_10/B.2.10.0600. - Unique DAGs.feature`
- `B/Data Import_16/B.3.16.0400. - Field Validation.feature`
- `B/Data Import_16/B.3.16.0800. - Repeat Instrument Import.feature`
- `B/Data Import_16/B.3.16.0900. - Import Restrictions.feature`
- `B/Data Import_16/B.3.16.1000. - Access Restrictions.feature`
- `B/Data Import_16/B.3.16.1100. - Change with edit access.feature`
- `B/Data Import_16/B.3.16.1300. - Data Import - DAGs.feature`
- `B/Data Import_16/B.3.16.1800. - Comparison table.feature`
- `B/Data Import_16/B.3.16.1900. - Rename duplicate record.feature`
- `B/Data Import_16/B.3.16.2100. - Stop background import.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0100. - Create Record.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0200. - Field Type Data Entry.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0300. - Radio button behavior.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0500. - Leave without Save.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0600. - Save Options.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0700. - Form status options.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.0900. - Rename Record.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.1100. - Delete Record Data.feature`
- `B/Direct Data Entry - Data Collection Instrument_14/B.3.14.1200. - Delete Record.feature`
- `B/Direct Data Entry - Survey_15/B.3.15.0300. - Survey Distribution Participant List.feature`
- `B/Direct Data Entry - Survey_15/B.3.15.0500. - Survey Alerts and Prompts.feature`
- `B/Direct Data Entry - Survey_15/B.3.15.0800. - Edit Survey Responses.feature`
- `B/Direct Data Entry - Survey_15/B.3.15.0900. - Survey Response Status.feature`
- `B/Draft Mode_20/B.4.20.0300. - Instrument Behavior.feature`
- `B/Draft Mode_20/B.4.20.0400. - Draft Mode Summary.feature`
- `B/Draft Mode_20/B.4.20.0800. - Draft warning.feature`
- `B/Export Data_21/B.5.21.0200. - Export Data to External Format.feature`
- `B/Export Data_21/B.5.21.0300. - REDUNDANT.feature`
- `B/Export Data_21/B.5.21.0400. - Export Specific Forms.feature`
- `B/Export Data_21/B.5.21.0600. - User Access Restrictions.feature`
- `B/Longitudinal Project Setup_27/B.4.27.0400. - Event Designation.feature`
- `B/Longitudinal Project Setup_27/B.4.27.0700. - delete events.feature`
- `B/My Projects_13/B.6.13.0200. - Archived Projects.feature`
- `B/Online Designer_7/B.6.7.0200. - Create Instrument.feature`
- `B/Online Designer_7/B.6.7.0300. - Rename Instrument.feature`
- `B/Online Designer_7/B.6.7.0400. - Copy Instrument.feature`
- `B/Online Designer_7/B.6.7.0500. - Delete Instrument.feature`
- `B/Online Designer_7/B.6.7.0700. - Field Textbox.feature`
- `B/Online Designer_7/B.6.7.1000. - Field Multiple Choice.feature`
- `B/Online Designer_7/B.6.7.1100. - Field Radio.feature`
- `B/Online Designer_7/B.6.7.1200. - Field Checkbox.feature`
- `B/Online Designer_7/B.6.7.1500. - Field Descriptive Text.feature`
- `B/Online Designer_7/B.6.7.1900. - Field Management.feature`
- `B/Online Designer_7/B.6.7.2000. - Field Matrix.feature`
- `B/Project Setup_4/B.6.4.1000. - Project Copy.feature`
- `B/Project Setup_4/B.6.4.1200. - Delete Project.feature`
- `B/Project Status_11/B.6.11.0200. - Move project status.feature`
- `B/Project Status_11/B.6.11.0600. - Record Limit Project Override.feature`
- `B/Project Status_11/B.6.11.0700. - Record Limit Project Status.feature`
- `B/Project Status_11/B.6.11.0800. - Record limit setting in development.feature`
- `B/Project Status_11/B.6.11.0900. - Record Limit User Activity Log.feature`
- `B/Project Status_11/B.6.11.1000. - Record Limit Override Admin.feature`
- `C/Data Quality_18/C.4.18.0300. - Data Quality execute rules.feature`
- `C/Data Quality_18/C.4.18.0500. - Data Quality disrepancies.feature`
- `C/Data Quality_18/C.4.18.0600. - Data Quality exclude rules.feature`
- `C/Data Quality_18/C.4.18.0700. - Data Quality edit rules.feature`
- `C/Data Quality_18/C.4.18.1400. - Data Quality support user rights.feature`
- `C/File Repository_26/C.3.26.0300. - Storage & Organization.feature`
- `C/Randomization_30/C.3.30.0500. - Randomization rights randomize.feature`
- `C/Randomization_30/C.3.30.1100. - Randomization rights execute.feature`
- `C/Randomization_30/C.3.30.1300. - REDUNDANT.Randomization export.feature`
- `C/Randomization_30/C.3.30.1400. - Randomization model.feature`
- `C/Randomization_30/C.3.30.1500. - Randomization blind.feature`
- `C/Randomization_30/C.3.30.1600. - Randomization view dashboard.feature`
- `C/Randomization_30/C.3.30.1700. - Randomization view allocation.feature`
- `C/Record Locking & E-Signatures_19/C.2.19.0200. - Lock form display.feature`
- `C/Record Locking & E-Signatures_19/C.2.19.0500. - eSign display.feature`
- `C/Record Locking & E-Signatures_19/C.2.19.0600. - Locking module navigation.feature`
- `C/Record Locking & E-Signatures_19/C.2.19.0700. - eSign customization.feature`
- `C/e-Consent framework_24/C.3.24.1400. - eConsent custom note.feature`
- `C/e-Consent framework_24/C.3.24.1600. - REDUNDANT.eConsent field.feature`
- `C/e-Consent framework_24/C.3.24.2700. - PDF save location.feature`
- `C/eDoc_28/C.3.28.1400. -  REDUNDANT.file upload password.feature`
- `C/eDoc_28/C.3.28.1500. - REDUNDANT.record_locking_verify.feature.feature`

## Renamed only (2, ours)

| Previous name | Current name |
|---|---|
| `D/Send It_105/D.105.300 - REDUNDANT.feature` | `D/Send It_105/D.105.0300. - REDUNDANT.feature` |
| `D/eDocs_28/D.3.28.0100.feature` | `D/eDocs_28/D.3.28.0100. - Storage location for uploaded documents.feature` |

## Not yet synced from rsvc

These are on Vanderbilt's `staging` (tip `8b96d344`, 4 Nov) and are not counted above.

- New: `B/Export Data_21/B.5.21.0800. - Export All Records as PDF.feature`
- Modified: `A/Project Setup_4/A.6.4.0600. - Events and Arms in Production.feature`
