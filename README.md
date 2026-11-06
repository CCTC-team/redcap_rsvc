# CCTC RSVC

This repository is a fork of the [Regulatory and Software Validation Committee (RSVC)](https://github.com/vanderbilt-redcap/redcap_rsvc) repository.

- **Folders A, B, C** contain validation test scripts written and maintained by RSVC.
- **Folder D** contains additional test scripts written by CCTC for non-core features. This was lead by CCTC with some support from CCTU.

These scripts are intended to be run using the [CCTC REDCap Cypress Test Suite](https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/README.md).

## Who are we

The Cambridge Cancer Trials Centre (CCTC) is a collaboration between Cambridge University Hospitals NHS Foundation Trust, the University of Cambridge, and Cancer Research UK. Founded in 2007, CCTC designs and conducts clinical trials and studies to improve outcomes for patients with cancer or those at risk of developing it. In 2011, CCTC began hosting the Cambridge Clinical Trials Unit - Cancer Theme (CCTU-CT).

CCTC has two divisions: Cancer Theme, which coordinates trial delivery, and Clinical Operations.

---

## Upstream sync

`redcap_val` is periodically synced with Vanderbilt's `staging` branch by merge.

- **Last sync:** 2026-11-06, Vanderbilt `staging` at `8b96d344` (2026-11-04). It brings the new feature B.5.21.0800. A.6.4.0600 stays at 25 rows rather than upstream's 35, because 25 passes on REDCap 17.5.9; revisit this on the next REDCap bump.
- **Current CCTC tag:** `cctc_v1.0.21`. It includes the follow-up fixes for REDCap 17.5.6, the D.104.0300 invitation-log timing fix, the new D.106.1000 DRW rule H feature, the 4-digit ids on the Feature/Scenario lines of the D features (including D.9.0200's scenario and project name), the removal of the REDUNDANT C.2.19.1200/1400 stubs, the 2026-10-29 sync for 17.5.7 (with D.114.0100 moved off the removed "Edit image for the event" step), the 17.5.7 fixes to D.10.0700, D.106.0100, D.117.0100 and D.121.0100, and the field icon steps in D.106, D.113 and D.117 moved to Vanderbilt's `icon labeled "X" in the row labeled "Y"` step, with DRW query status checked in the popup. It also includes D.106 trimmed to what Vanderbilt's C.4.18.1500-2400 DRW features don't cover, and the 2026-11-06 sync. Needs rctf `cctc_v1.0.17`.
- **Deliberately absent on `redcap_val`:** CDIS features (`CDIS_31`), features that use external file storage, Bulk Record Delete (A.3.32.0100, B.3.32.0200), Project Administrator Groups (A.2.67), and upstream modules CCTC doesn't use. Upstream changes to these files come back as modify/delete conflicts in a sync; keep the deletion.

---

## Tier Definitions

| Tier | Definition | Ownership |
|------|-----------|-----------|
| **A – Core Admin-Level** | Core REDCap functionality requiring admin-level testing. | RSVC |
| **B – Core Project-Level** | Core REDCap functionality at the project level. | RSVC |
| **C – Non-Core RSVC Maintained** | Non-core functionality owned and maintained by RSVC/RVP. | RSVC |
| **D – Site-Managed** | Core features RSVC cannot feasibly test, or non-core features not covered by RSVC. | CCTC / Site |

---

## Supporting Files (`Files/`)

The `Files/` directory holds the supporting assets the feature tests depend on:

| Folder | Purpose |
|--------|---------|
| `dictionaries/` | Data dictionaries imported by tests |
| `import_files/` | Files uploaded/imported during tests |
| `cdisc_files/` | CDISC ODM files used by tests |
| `schemas/` | XSD/validation schemas (e.g. CDISC ODM) |
| `expected_exports/` | **Verified export references** — golden files that data-export tests compare downloaded exports against |

**These files are consumed from the Cypress framework's `cypress/fixtures/`, not from here directly.** When the test suite is installed (`npm run redcap_rsvc:install` in [redcap_cypress](https://github.com/CCTC-team/redcap_cypress)), everything under `Files/` is copied into `cypress/fixtures/` via:

```bash
cp -a redcap_rsvc/Files/* cypress/fixtures/
```

> **Important:** A plain `git checkout`/`git pull` of this repo updates `Files/` only — it does **not** update `cypress/fixtures/`, and neither does `npm install`. After changing anything under `Files/` (e.g. re-recording a verified export reference), the copy step above must be re-run for the change to reach the tests. `cypress/fixtures/` is git-ignored and treated as generated — always edit the source here under `Files/`.