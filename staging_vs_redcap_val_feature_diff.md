# Feature file changes: `staging` vs `redcap_val` (redcap_rsvc)

Generated 2026-10-16. Changes made on `origin/staging` since the merge-base with `origin/redcap_val` (`6af77e13`).
Staging is 442 commits ahead; redcap_val is 157 commits ahead.

Regenerate: `git diff -M --name-status origin/redcap_val...origin/staging -- '*.feature'`

**Summary** — "Not needed" = modules not used: CDIS_31, Access Control Groups_33, Project Administrator Groups_67, MOSIO_97.

| Change | Total | Not needed | Needed |
|---|---|---|---|
| Added | 84 | 69 | 15 |
| Modified | 189 | 31 | 158 (147 applied, 11 kept deleted) |
| Deleted | 2 | 0 | 2 |
| Renamed | 3 | 3 | 0 |
| **Total** | **278** | **103** | **175** |

Contents: [Merge outcome](#merge-outcome-syncupstream-2026-10-16) · [Needed](#needed) · [Not needed](#not-needed) · [redcap_val-only changes](#note-redcap_val-only-changes)

---

# Merge outcome (`sync/upstream-2026-10-16`)

How this list was applied when staging (`3f0a4546`) was merged into `redcap_val`:

- **Not needed: excluded.** 69 added files in Access Control Groups_33 (A/B/D), Project Administrator Groups_67, CDIS_31 (C/D) and MOSIO_97 were not added. The 34 CDIS_31 files staging modified or renamed stay deleted, as CCTC had already removed them. Fixtures used only by these modules were also left out: 8 `Files/import_files/ACG_*`/`*_for_ACG*` CSVs and `Files/cdisc_files/Project_7.31.xml`.
- **Needed added (15) and deleted (2): applied.** The 15 added features (still to be reviewed) and the B.3.16.1600/1700 REDUNDANT replacements are in. `Files/dictionaries/Project_4.9.modified.csv` is added for the new B.4.9.0100 scenario `.200`.
- **Needed modified (158): 147 applied, 11 kept deleted.** The 11 marked **kept deleted on redcap_val** below were removed earlier by CCTC (`8ca9bfc5`, `5059a819`, `ab47f57a`) because they need external file storage or are PIN-session REDUNDANT placeholders. They stay deleted.
- **Conflicts (41 files, 71 hunks): staging's lines plus CCTC's hardening.** Each conflict takes staging's wording (replacements for deprecated and removed rctf steps, 17.x labels) and keeps these CCTC additions:
  - `I wait for N second(s)` (25 hunks)
  - `I dismiss the "Okay" confirmation dialog if it appears` in place of `I click on the button labeled "Okay"` (42)
  - `I wait for the dialog to close` in place of the `Close` click in A.6.4.0500 (1)
  - the extra `I should see a button labeled "Survey options"` check (3)

  Where the two disagreed:
  - A.6.4.1600: takes staging's `Edit Survey Responses`, which matches REDCap 17.5.6 `rights_449`.
  - B.4.9.0100: takes staging's `Erase` dialog in place of CCTC's alert checks.
  - Randomization: takes staging's `Already uploaded … in the row labeled` in place of CCTC's `Delete allocation table?`.
  - C.3.24.0605: keeps CCTC's `Save & Exit Form` (`6d9b6fb8`, headless/CI stabilisation).
- **Removed rctf phrasing:** staging fixes B.6.7.2000, C.2.19.0700 and B.6.7.0200. The CCTC-only D.111.100 Codebook was updated by hand to `I enter "Data Types" into the input field labeled "New instrument name:"`.

---

# Needed

## Added (15)

- Feature Tests/A/User Settings_6/A.2.6.0700. - Adding user to project.feature
- Feature Tests/A/eDoc_28/A.3.28.1600. - Restricted Upload MIME Validation.feature
- Feature Tests/B/Assign User Rights_6/B.2.6.0600. - Instrument level delete privileges.feature
- Feature Tests/B/Data Import_16/B.3.16.1600. - REDUNDANT.feature
- Feature Tests/B/Data Import_16/B.3.16.1700. - REDUNDANT.feature
- Feature Tests/B/Direct Data Entry - Data Collection Instrument_14/B.3.14.1300. - Retaining user preferences for record search, navigation, and arm selection.feature
- Feature Tests/B/Online Designer_7/B.6.7.2100. - Enhanced Signature.feature
- Feature Tests/B/Online Designer_7/B.6.7.2200. - User Interface - Online Designer - Field Creation - Variable Name Validation.feature
- Feature Tests/B/Online Designer_7/B.6.7.2300. - Dynamic SQL Field Creation.feature
- Feature Tests/C/Data Quality_18/C.4.18.1600. - Data Resolution Workflow user privileges.feature
- Feature Tests/C/Data Quality_18/C.4.18.1700. - Data Resolution Workflow Query Lifecycle.feature
- Feature Tests/C/Data Quality_18/C.4.18.1800. - Data Resolution Workflow Data Quality Results.feature
- Feature Tests/C/File Repository_26/C.3.26.1100. - Project Settings – File Repository.feature
- Feature Tests/C/Randomization_30/C.3.30.1900. - Randomization dashboard export.feature
- Feature Tests/C/Record Locking & E-Signatures_19/C.2.19.1500. - Record Locking Customization settings as part of a Project XML file.feature

## Deleted (2)

- Feature Tests/B/Data Import_16/B.3.16.1600. - Background erorr report.feature
- Feature Tests/B/Data Import_16/B.3.16.1700. - export error report.feature

> B.3.16.1600 / 1700 were replaced by `... - REDUNDANT.feature` placeholders (see Added).

## Modified (158)

### Nature of modifications

Each needed modified file below is tagged with every kind of change it contains (a file can carry several tags):

| Tag | Meaning | Files |
|---|---|---|
| `new-test` | Adds new test scenario(s) to an existing feature file | 2 |
| `rctf-deprecated` | Replaces rctf steps flagged `@deprecated` (still work today) | 118 |
| `rctf-removed` | Replaces step phrasing **removed** from rctf — the redcap_val version is broken now | 3 |
| `core` | Matches REDCap core changes (labels, tables, logging format, row order, PDF text) | 90 |
| `test-fix` | Test corrections not driven by REDCap or rctf (typos, wrong test data, extra assertions, waits) | 16 |
| `housekeeping` | Comments, REDUNDANT markers, Feature title wording | 22 |

<details><summary>Tag combinations (each file counted once)</summary>

| Combination | Files |
|---|---|
| `rctf-deprecated, core` | 62 |
| `rctf-deprecated` | 40 |
| `housekeeping` | 16 |
| `core` | 15 |
| `test-fix` | 7 |
| `rctf-deprecated, core, test-fix` | 5 |
| `rctf-deprecated, core, housekeeping` | 4 |
| `rctf-deprecated, test-fix` | 3 |
| `new-test, rctf-deprecated, core` | 1 |
| `new-test, rctf-deprecated, core, test-fix, housekeeping` | 1 |
| `rctf-deprecated, housekeeping` | 1 |
| `rctf-removed, core` | 1 |
| `rctf-removed` | 1 |
| `rctf-deprecated, rctf-removed, core` | 1 |
| **Total** | **158** |

</details>

#### rctf steps replaced on staging

| Old step (as used on redcap_val) | rctf status | Replacement on staging |
|---|---|---|
| `I should see a dialog containing the following text: "…"` | deprecated | `I should see "…"` (sometimes plus `I click on the button labeled "Okay"`) |
| `I select the submit option labeled "…" on the Data Collection Instrument` | deprecated | `I click on the button labeled "Save & Exit Form"`, or `"More save options"` → `I click on the link labeled "…"` |
| `I enter Choices of "…" into the open "Edit Field" dialog box` | deprecated | `I enter "…" in the textarea field labeled "Choices"` |
| `I select record ID "1" from arm name "…" on the Add / Edit record page` | deprecated | `I select "1" on the dropdown field labeled "select record"` |
| `I should see / click on the "process request" icon for the "…" request created for the project named "…" within the "Pending Requests" table` | deprecated | `I click on the icon labeled "Actions"` / `"Approve request"` `in the row labeled "…"` |
| `I click on the "View Report" button for the "…" report in the My Reports & Exports table` | deprecated | `I click on the button labeled "View Report" in the row labeled "…"` |
| `I click the element containing the following text: "…"` | deprecated | `I click on "…"` |
| `I click on the date picker widget on the field labeled "…"` | deprecated | `I click on the icon labeled "Click to select a date/time" in the row labeled "…"` |
| `… field in the Matrix column labeled exactly "…"` | **removed** | `… field in the Matrix column labeled "…"` |
| `… textarea field within the Record Locking Customization table for the Data Collection Instrument named "…"` | **removed** | generic textarea step |
| `… input field labeled "…" within the data collection instrument list` | **removed** | `… input field labeled "…"` |

> **Resolved by the sync merge** (staging fixes the first three; D.111.100 fixed by hand). **Was broken on redcap_val:** rctf commit `adefdba` (2026-06-29, "Removed language that did not actually affect the action of certain text field steps") is already in CCTC rctf `redcap_val`. It dropped `labeled exactly`, `within the Record Locking Customization table for the Data Collection Instrument named`, `for the Discrepant field labeled`, `for the field labeled` and the trailing base-element suffix on input-field steps. redcap_val features still using them (undefined steps): B.6.7.2000 Field Matrix (6), C.2.19.0700 eSign customization (4), B.6.7.0200 Create Instrument (1), and redcap_val-only D.111.100 Codebook (1).

> **New tests inside modified files:** B.3.32.0200 Bulk Record Delete adds scenarios `.0900` Bulk Delete with Mixed Delete Privileges and `.1000` Bulk Delete Records Using Background Process; B.4.9.0100 Branching Logic adds scenario `.200` Branching Logic via Data Dictionary Upload, which needs the new fixture `Files/dictionaries/Project_4.9.modified.csv` (added on staging in e0a66f8c).

> `core` edits assume a recent REDCap core UI; verify against the REDCap version you run before applying.

### A/Add Manage Users_2

- A.2.2.0200. - Suspend - Unsuspend.feature `[rctf-deprecated, core]`
- A.2.2.0400. - Delete.feature `[test-fix]`
- A.2.2.0600. - Account Lockout.feature `[test-fix]`
- A.2.2.0700. - Account Lockout Time Change.feature `[test-fix]`
- A.2.2.0800. - Auto-Logout Inactivity Time.feature `[rctf-deprecated, test-fix]`

### A/Assign Administrators_3

- A.2.3.0100. - REDUNDANT Administrators Table.feature `[housekeeping]`
- A.2.3.0200. - Add Remove Admins.feature `[rctf-deprecated, core]`
- A.2.3.0300. - Super Users and Account Managers.feature `[rctf-deprecated]`

### A/Field Validation_8

- A.4.8.0100. - Enable field validation.feature `[core]`

### A/Project Setup_4

- A.6.4.0200. - Move to Production.feature `[rctf-deprecated]`
- A.6.4.0300. - REDUNDANT Edit Survey Responses.feature `[housekeeping]`
- A.6.4.0400. - Draft Mode.feature `[rctf-deprecated, core]`
- A.6.4.0500. - Repeatable Instruments.feature `[rctf-deprecated, core]`
- A.6.4.0600. - Events and Arms in Production.feature `[rctf-deprecated, core]`
- A.6.4.1600. - Edit Survey Responses.feature `[rctf-deprecated]`

### A/Project Status_11

- A.6.11.0500. -  Restrict the Number of Test Records.feature `[rctf-deprecated, core]`

### A/Record Locking & E-Signatures_19

- A.2.19.1000. - Record locking 6-digit PIN.feature `[rctf-deprecated, core]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.2.19.1100. - REDUNDANT.Pin session.feature `[housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)

### A/e-Consent framework_24

- A.3.24.1100. - eConsent custom message.feature `[rctf-deprecated]`
- A.3.24.3000. - eConsent PL edit.feature `[rctf-deprecated]`

### A/eDoc_28

- A.3.28.0100. - eDoc enable.feature `[rctf-deprecated, test-fix]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.0300. - eDoc File Upload.feature `[rctf-deprecated]`
- A.3.28.0400. - eDoc Send-It Upload Configuration.feature `[core]`
- A.3.28.0500. - eDoc File Attachments.feature `[rctf-deprecated]`
- A.3.28.0600. - eDoc project PDF.feature `[rctf-deprecated]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.0700. - REDUNDANT.PDF External Storage.feature `[housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.0800. - REDUNDANT.External Store File Upload.feature `[housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.0900. - REDUNDANT.External Store Send-It.feature `[housekeeping]`
- A.3.28.1000. - REDUNDANT.External Store Descriptive File.feature `[housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.1100. - File Upload w Password.feature `[rctf-deprecated, core, housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.1200. - File Upload  w Pin.feature `[rctf-deprecated, core, housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)
- A.3.28.1300. - PDF external storage.feature `[rctf-deprecated, core, housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)

### B/Assign User Rights_6

- B.2.6.0100. - Basic Privileges.feature `[rctf-deprecated, core]`
- B.2.6.0200. - Data Entry Form Access.feature `[rctf-deprecated]`
- B.2.6.0300. - Data Export Rights.feature `[rctf-deprecated, core]`
- B.2.6.0400. - Creating Copying Deleting Roles.feature `[rctf-deprecated]`
- B.2.6.0500. - Adding and Removing Users from Roles.feature `[rctf-deprecated]`

### B/Branching Logic_9

- B.4.9.0100. - Branching Logic.feature `[new-test, rctf-deprecated, core]`

### B/Bulk Record Delete_32

- B.3.32.0200. - Bulk Record Delete.feature `[new-test, rctf-deprecated, core, test-fix, housekeeping]`

### B/Data Access Groups_10

- B.2.10.0100. - Create Edit Delete.feature `[rctf-deprecated, core, test-fix]`
- B.2.10.0200. - Add Remove Users.feature `[rctf-deprecated, core]`
- B.2.10.0300. - Multiple DAGs.feature `[rctf-deprecated]`
- B.2.10.0400. - User and Record Restrictions.feature `[rctf-deprecated, core]`
- B.2.10.0600. - Unique DAGs.feature `[rctf-deprecated]`

### B/Data Import_16

- B.3.16.0400. - Field Validation.feature `[core]`
- B.3.16.0800. - Repeat Instrument Import.feature `[rctf-deprecated]`
- B.3.16.0900. - Import Restrictions.feature `[rctf-deprecated, core]`
- B.3.16.1000. - Access Restrictions.feature `[rctf-deprecated, core]`
- B.3.16.1100. - Change with edit access.feature `[rctf-deprecated, core]`
- B.3.16.1300. - Data Import - DAGs.feature `[rctf-deprecated, core]`
- B.3.16.1800. - Comparison table.feature `[core]`
- B.3.16.1900. - Rename duplicate record.feature `[core]`
- B.3.16.2100. - Stop background import.feature `[test-fix]`

### B/Direct Data Entry - Data Collection Instrument_14

- B.3.14.0100. - Create Record.feature `[rctf-deprecated, core]`
- B.3.14.0200. - Field Type Data Entry.feature `[rctf-deprecated, core]`
- B.3.14.0300. - Radio button behavior.feature `[rctf-deprecated, core]`
- B.3.14.0400. - Datetime Fields.feature `[rctf-deprecated]`
- B.3.14.0500. - Leave without Save.feature `[rctf-deprecated, core]`
- B.3.14.0600. - Save Options.feature `[rctf-deprecated, core]`
- B.3.14.0700. - Form status options.feature `[rctf-deprecated, core]`
- B.3.14.0900. - Rename Record.feature `[rctf-deprecated, core]`
- B.3.14.1100. - Delete Record Data.feature `[rctf-deprecated, core]`
- B.3.14.1200. - Delete Record.feature `[rctf-deprecated, core]`

### B/Direct Data Entry - Survey_15

- B.3.15.0100. - Enable Instrument as Survey.feature `[rctf-deprecated]`
- B.3.15.0200. - Survey Status.feature `[rctf-deprecated]`
- B.3.15.0300. - Survey Distribution Participant List.feature `[housekeeping]`
- B.3.15.0400. - Open Survey from Form.feature `[rctf-deprecated, core, housekeeping]`
- B.3.15.0500. - Survey Alerts and Prompts.feature `[rctf-deprecated, housekeeping]`
- B.3.15.0800. - Edit Survey Responses.feature `[rctf-deprecated, core]`
- B.3.15.0900. - Survey Response Status.feature `[rctf-deprecated]`

### B/Draft Mode_20

- B.4.20.0300. - Instrument Behavior.feature `[rctf-deprecated]`
- B.4.20.0400. - Draft Mode Summary.feature `[rctf-deprecated]`
- B.4.20.0800. - Draft warning.feature `[rctf-deprecated]`

### B/Export Data_21

- B.5.21.0100. - Export PHI.feature `[rctf-deprecated, core]`
- B.5.21.0200. - Export Data to External Format.feature `[rctf-deprecated, core]`
- B.5.21.0300. - REDUNDANT.feature `[housekeeping]`
- B.5.21.0400. - Export Specific Forms.feature `[rctf-deprecated, core]`
- B.5.21.0600. - User Access Restrictions.feature `[rctf-deprecated]`

### B/Field Validation_8

- B.4.8.0200. - Text Validation.feature `[rctf-deprecated, core]`
- B.4.8.0300. - Field Ranges.feature `[rctf-deprecated, core]`

### B/Longitudinal Project Setup_27

- B.4.27.0700. - delete events.feature `[core]`

### B/My Projects_13

- B.6.13.0200. - Archived Projects.feature `[rctf-deprecated]`

### B/Online Designer_7

- B.6.7.0200. - Create Instrument.feature `[rctf-removed, core]`
- B.6.7.0300. - Rename Instrument.feature `[core]`
- B.6.7.0400. - Copy Instrument.feature `[rctf-deprecated, core]`
- B.6.7.0500. - Delete Instrument.feature `[rctf-deprecated, core]`
- B.6.7.0700. - Field Textbox.feature `[rctf-deprecated]`
- B.6.7.1000. - Field Multiple Choice.feature `[rctf-deprecated]`
- B.6.7.1100. - Field Radio.feature `[rctf-deprecated]`
- B.6.7.1200. - Field Checkbox.feature `[rctf-deprecated]`
- B.6.7.1500. - Field Descriptive Text.feature `[rctf-deprecated]`
- B.6.7.1900. - Field Management.feature `[rctf-deprecated, core]`
- B.6.7.2000. - Field Matrix.feature `[rctf-removed]`

### B/Project Setup_4

- B.6.4.1000. - Project Copy.feature `[rctf-deprecated, core]`
- B.6.4.1200. - Delete Project.feature `[rctf-deprecated, test-fix]`
- B.6.4.1400. - Repeating Surveys.feature `[rctf-deprecated, core, test-fix]`

### B/Project Status_11

- B.6.11.0200. - Move project status.feature `[rctf-deprecated]`
- B.6.11.0600. - Record Limit Project Override.feature `[rctf-deprecated, core]`
- B.6.11.0700. - Record Limit Project Status.feature `[rctf-deprecated, core]`
- B.6.11.0800. - Record limit setting in development.feature `[rctf-deprecated, core]`
- B.6.11.0900. - Record Limit User Activity Log.feature `[test-fix]`
- B.6.11.1000. - Record Limit Override Admin.feature `[core]`

### C/Data Quality_18

- C.4.18.0200. - Data Quality create rules.feature `[rctf-deprecated, core, test-fix]`
- C.4.18.0300. - Data Quality execute rules.feature `[core]`
- C.4.18.0500. - Data Quality disrepancies.feature `[core]`
- C.4.18.0600. - Data Quality exclude rules.feature `[core]`
- C.4.18.0700. - Data Quality edit rules.feature `[core]`
- C.4.18.1400. - Data Quality support user rights.feature `[core]`

### C/File Repository_26

- C.3.26.0200. - View Access & User Rights.feature `[rctf-deprecated, core]`
- C.3.26.0300. - Storage & Organization.feature `[rctf-deprecated, core]`

### C/Randomization_30

- C.3.30.0500. - Randomization rights randomize.feature `[rctf-deprecated]`
- C.3.30.0600. - Randomization DAG.feature `[rctf-deprecated, core]`
- C.3.30.0700. - Randomization create.feature `[rctf-deprecated, core]`
- C.3.30.0800. - Randomization automatic.feature `[rctf-deprecated]`
- C.3.30.0900. - Randomization lock.feature `[test-fix]`
- C.3.30.1000. - Randomization assignment.feature `[rctf-deprecated, core]`
- C.3.30.1100. - Randomization rights execute.feature `[rctf-deprecated, core]`
- C.3.30.1200. - Randomization audit trail.feature `[rctf-deprecated]`
- C.3.30.1300. - REDUNDANT.Randomization export.feature `[housekeeping]`
- C.3.30.1400. - Randomization model.feature `[rctf-deprecated]`
- C.3.30.1500. - Randomization blind.feature `[rctf-deprecated, core]`
- C.3.30.1600. - Randomization view dashboard.feature `[rctf-deprecated, core]`
- C.3.30.1700. - Randomization view allocation.feature `[rctf-deprecated, core]`
- C.3.30.1800. - Randomization Admin actions.feature `[rctf-deprecated, core]`

### C/Record Locking & E-Signatures_19

- C.2.19.0200. - Lock form display.feature `[test-fix]`
- C.2.19.0500. - eSign display.feature `[rctf-deprecated]`
- C.2.19.0600. - Locking module navigation.feature `[core]`
- C.2.19.0700. - eSign customization.feature `[rctf-deprecated, rctf-removed, core]`
- C.2.19.0900. - eSign and Lock access.feature `[rctf-deprecated]`
- C.2.19.1200. - REDUNDANT.Pin session.feature `[housekeeping]` — **deleted on redcap_val 2026-10-26** (removed by CCTC: PIN session)
- C.2.19.1400. - REDUNDANT.record_locking_external_storage.feature `[housekeeping]` — **deleted on redcap_val 2026-10-26** (removed by CCTC: external file storage)
- C.2.19.1300. - REDUNDANT.Pin_session_record_locking.feature `[housekeeping]` — **kept deleted on redcap_val** (removed by CCTC: external file storage / PIN session)

### C/Reporting_22

- C.5.22.0100. - Report Access.feature `[rctf-deprecated]`

### C/e-Consent framework_24

- C.3.24.0105. - eConsent enable.feature `[rctf-deprecated]`
- C.3.24.0205. - eConsent footer.feature `[rctf-deprecated, core]`
- C.3.24.0305. - eConsent status.feature `[rctf-deprecated]`
- C.3.24.0405. - eConsent goverend snapshot.feature `[rctf-deprecated, core]`
- C.3.24.0505. - eConsent download PDF.feature `[rctf-deprecated, core]`
- C.3.24.0605. - eConsent edit.feature `[rctf-deprecated, core, test-fix]`
- C.3.24.0705. - eConsent Certification Page.feature `[rctf-deprecated, core]`
- C.3.24.0805. - eConsent repeat.feature `[rctf-deprecated, core]`
- C.3.24.1200. - eConsent header.feature `[rctf-deprecated, core]`
- C.3.24.1300. - eConsent filename.feature `[rctf-deprecated, core]`
- C.3.24.1400. - eConsent custom note.feature `[core]`
- C.3.24.1500. - eConsent version control.feature `[rctf-deprecated, core, test-fix]`
- C.3.24.1600. - REDUNDANT.eConsent field.feature `[housekeeping]`
- C.3.24.1700. - eConsent DAG.feature `[rctf-deprecated, core]`
- C.3.24.1900. - eConsent autosave PDF.feature `[rctf-deprecated, core]`
- C.3.24.2000. - eConsent display.feature `[rctf-deprecated, core]`
- C.3.24.2200. - PDF triggers.feature `[rctf-deprecated, core]`
- C.3.24.2300. - PDF display.feature `[rctf-deprecated, core]`
- C.3.24.2500. - PDF conditional logic.feature `[rctf-deprecated, core]`
- C.3.24.2600. - PDF multi.feature `[rctf-deprecated]`
- C.3.24.2700. - PDF save location.feature `[rctf-deprecated]`
- C.3.24.2800. - PDF filename.feature `[rctf-deprecated, core]`
- C.3.24.2900. - eConsent PDF logging.feature `[rctf-deprecated, core]`

### C/eDoc_28

- C.3.28.1400. -  REDUNDANT.file upload password.feature `[housekeeping]`
- C.3.28.1500. - REDUNDANT.record_locking_verify.feature.feature `[housekeeping]`

---

# Not needed

These modules are not used, so their changes can be skipped:

| Module | Added | Renamed | Modified |
|---|---|---|---|
| Access Control Groups (A/B/D AccessControlGroup_33) | 55 | 0 | 0 |
| A/Project Administrator Groups_67 | 4 | 0 | 0 |
| C/CDIS_31 | 2 | 1 | 31 |
| D/CDIS_31 | 1 | 2 | 0 |
| D/MOSIO_97 | 7 | 0 | 0 |

## Added (69)

#### Access Control Groups_33 (55)

- Feature Tests/A/Access Control Groups_33/A.2.33.0100. - Enabling and Disabling ACGs.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0200. - REDUNDANT.Enabling and Disabling ACGs Warning.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0300. - REDUNDANT.Default assignment of No Rights to all users when enabled.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0400. - Creating new ACG.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0500. - Editing ACG.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0600. - Designating one ACG as the Default ACG.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0700. - The system shall support uploading and downloading ACG definitions via CSV.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0800. - Custom HTML-enabled ACG violation message.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.0900. - The system shall restrict ACG configuration pages to REDCap administrators.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1000. - ACG Reports.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1100. - Hide ACG functionality when ACGs are disabled.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1200. - Reapply ACG rules when ACGs are re-enabled.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1300. - Default No Rights ACG.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1400. - The system shall allow editing privileges of the No Rights ACG.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1500. - The system shall display a project-level ACG Compliance page to administrators.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1600. - The system shall restore the default ACG violation message when the custom message is cleared.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1700. - The system shall send ACG alerts only when triggered manually by an administrator.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1800. - The system shall provide multiple ACg report categories.---Reports Dropdown.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.1900. - The system shall allow exporting ACG reports as CSV.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.2000. - The system shall provide filters for all ACG report columns.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.2100. - The system shall store ACG alert batches in the alerts table.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.2400. - The system shall support batch IDs for ACG alerts.---Alerts Table.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.2500. - REDUNDANT.Required columns in Users with Non-compliant Rights reports.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.2600. - REDUNDANT.Required columns in Projects with Non Compliant Rights reports.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.3100. - Reject ACG CSV uploads containing invalid group IDs.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.3200. - Reject ACG CSV uploads containing invalid usernames.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.3300. - Last occurrence of each username when duplicates appear in an ACG CSV import.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.3400. - REDUNDANT.On-screen error messages when an ACG CSV upload fails.feature
- Feature Tests/A/Access Control Groups_33/A.2.33.4600. - ACG Project Creating and Copying.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.2700. - Exporting user-to-ACG assignments.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.2800. - Importing user-to-ACG assignments.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.2900. - Table of all users and their assigned ACGs.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.3000. - Editing a user’s ACG assignment in edit mode.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.3500. - Block project level right assignment that exceeds user ACG.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.3600. - Block role assignment that exceeds user ACG.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.3700. - Block project level privelege assignment that exceeds user ACG.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.3800. - REDUNDANT. Message listing privileges that violate the user’s ACG.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.3900. - Link in the violation message to the user’s ACG assignment.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4000. - REDUNDANT.The system shall evaluate ACG limits when adding a new project user.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4100. - The system shall evaluate ACG limits during CSV user and role import..feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4200. - The system shall allow DAG assignment.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4300. - REDUNDANT.The system shall identify users whose project rights exceed their ACG.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4400. - The system shall provide filters on the ACG Compliance page.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4500. - Expiring users from the ACG Compliance page.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4700. - The system shall display past and scheduled ACG alerts.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.4800. - The system shall allow deleting scheduled ACG alerts.feature
- Feature Tests/B/AccessControlGroup_33/B.2.33.5000. - Searching user ACG assignments.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.2200.- The system shall store ACG assignment in the user mapping table.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.2300.- The system shall store ACG definitions in ACG definitions table.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.4900.- The system shall allow smart variables in violation message.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.5100.- The system shall allow emailing users for ACG complaince.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.5200.- The system shall allow smart variables in ACG complaince email.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.5300.- The system shall evaluate ACG before project level validation.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.5400.- The system shall support ACG smart variables.feature
- Feature Tests/D/AccessControlGroup_33/D.2.33.5500.- The system shall format smart variable output consistently.feature

#### A/Project Administrator Groups_67 (4)

- Feature Tests/A/Project Administrator Groups_67/A.2.67.0100. - Project Administrator Group administrators.feature
- Feature Tests/A/Project Administrator Groups_67/A.2.67.0200. - Project Administrator Group administrators.feature
- Feature Tests/A/Project Administrator Groups_67/A.2.67.0300. - PAG Assignment and Administration for the project.feature
- Feature Tests/A/Project Administrator Groups_67/A.2.67.0400. - PAG Assoiated and Automatic Project Assignment for Users.feature

#### C/CDIS_31 (2)

- Feature Tests/C/CDIS_31/C.3.31.0500. - Displaying information about CDP on Project Setup page.feature
- Feature Tests/C/CDIS_31/C.3.31.0600. - The system shall support configuring user rights to assign or restrict Clinical Data Pull CDP privileges within a project.feature

#### D/CDIS_31 (1)

- Feature Tests/D/CDIS_31/D.3.31.0700. - The system shall support converting source system timestamps from GMT to local server time.feature

#### D/MOSIO_97 (7)

- Feature Tests/D/MOSIO_97/D.8.97.0100. - System level Mosio enable and Disable.feature
- Feature Tests/D/MOSIO_97/D.8.97.0200. - The system shall support configuration privileges for Mosio SMS services.feature
- Feature Tests/D/MOSIO_97/D.8.97.0300. - The system shall support controlling whether information about Mosio SMS services is displayed to users on the Project Setup page.feature
- Feature Tests/D/MOSIO_97/D.8.97.0400. - The system shall support project-level enable and disable of Mosio SMS services.feature
- Feature Tests/D/MOSIO_97/D.8.97.0500. - The system shall restrict access to Mosio project level enablement.feature
- Feature Tests/D/MOSIO_97/D.8.97.0600. - The system shall require entry of a Mosio API key to complete project-level enablement.feature
- Feature Tests/D/MOSIO_97/D.8.97.0700. - The system shall allow SMS available for supported REDCap communication features within a project.feature

## Renamed (3)

- `Feature Tests/C/CDIS_31/C.3.31.3000. - REDUNDENT.CDM to be enabled by an administrator in the User Rights.feature` → `Feature Tests/C/CDIS_31/C.3.31.3000. - REDUNDANT.CDM to be enabled by an administrator in the User Rights.feature` (R057)
- `Feature Tests/D/CDSI_31/D.3.31.1000.feature` → `Feature Tests/D/CDIS_31/D.3.31.1000.feature` (R100)
- `Feature Tests/D/CDSI_31/D.3.31.1600.feature` → `Feature Tests/D/CDIS_31/D.3.31.1600.feature` (R100)

## Modified (31)

#### C/CDIS_31

- C.3.31.0100. - Enabling and Disabling Clinical Data Pull.feature
- C.3.31.0200. - Enabling and Disabing Clinical Data Mart CDM.feature
- C.3.31.0300. - Enable and Disable Instant Adjudication for CDP.feature
- C.3.31.0400. - Enable and Disable Break the glass for CDP.feature
- C.3.31.0800. - Allowing or restricting the import of patient email addresses.feature
- C.3.31.0900. - The system shall support displaying custom instructions or institution-specific requirements for enabling CDP, including HTML formatting.feature
- C.3.31.1100. - Enabling CDP in a project.feature
- C.3.31.1200. - Allowing or restricting the import of patient email addresses into CDP.feature
- C.3.31.1400. - Allowing or restricting the import of patient email addresses into CDM.feature
- C.3.31.1500. - Setting CDP user rights in a project.feature
- C.3.31.1700. - Mapping REDCap fields to EHR source fields.feature
- C.3.31.1800. - The system shall support defining day offsets for temporal field.feature
- C.3.31.1900. - Limiting temporal data fetch to records with dates.feature
- C.3.31.2000. - The system shall support fetching data from the EHR and displaying values in the adjudication interface.feature
- C.3.31.2100. - Adjudicates and selects values in the CDP adjudication interface.feature
- C.3.31.2200. - The system shall support optional preview fields on the CDP mapping page.feature
- C.3.31.2300. - The system shall support up to five preview fields per CDP-enabled project.feature
- C.3.31.2400. - REDUNDANT.The system shall support pre-selection of single-value source data and temporal values.feature
- C.3.31.2500. - The system shall support adjudication of source data.feature
- C.3.31.2600. - Count of new unadjudicated values.feature
- C.3.31.2700. - REDUNDANT.creation of new records in a CDP-enabled project.feature
- C.3.31.2800. - The system shall support importing and exporting CDP mapping configurations.feature
- C.3.31.2900. - CDP Mapping Helper tool.feature
- C.3.31.3100. - Automatic project creation of new CDM project.feature
- C.3.31.3200. - Fetching data in bulk via CDM.feature
- C.3.31.3300. - Fetching data in bulk via CDM with date restrictions.feature
- C.3.31.3400. - REDUNDANT.The system shall support fetching data in bulk one time for a CDM project.feature
- C.3.31.3500. - Multiple bulk fetches of clinical data.feature
- C.3.31.3600. - REDUNDANT.The system shall support fetching data into a repeating instance for similar data on a CDM project.feature
- C.3.31.3700. - Reqesting a configuration update to a CDM fetch request.feature
- C.3.31.3800. - Auto-Fetch for CDP and CDM enabled projects.feature

---

## Note: redcap_val-only changes

redcap_val also has its own feature changes not on staging: 73 A, 55 D, 56 M — these may conflict on merge.
