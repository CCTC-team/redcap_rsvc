# CCTC RSVC

This repository is a fork of the [Regulatory and Software Validation Committee (RSVC)](https://github.com/vanderbilt-redcap/redcap_rsvc) repository.

- **Folders A, B, C** contain validation test scripts written and maintained by RSVC.
- **Folder D** contains additional test scripts written by CCTC for non-core features. This was lead by CCTC with some support from CCTU.

These scripts are intended to be run using the [CCTC REDCap Cypress Test Suite](https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/README.md).

## Who are we

The Cambridge Cancer Trials Centre (CCTC) is a collaboration between Cambridge University Hospitals NHS Foundation Trust, the University of Cambridge, and Cancer Research UK. Founded in 2007, CCTC designs and conducts clinical trials and studies to improve outcomes for patients with cancer or those at risk of developing it. In 2011, CCTC began hosting the Cambridge Clinical Trials Unit - Cancer Theme (CCTU-CT).

CCTC has two divisions: Cancer Theme, which coordinates trial delivery, and Clinical Operations.

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