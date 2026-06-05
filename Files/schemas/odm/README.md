# CDISC ODM 1.3.1 XSD schema set

Vendored XML Schema files used by the `validateFileFormat` Cypress task
(`cypress.config.js`) to schema-validate REDCap's CDISC ODM (XML) data export in
feature `D.21.700`.

## Files

| File | Role |
|---|---|
| `ODM1-3-1.xsd` | Root schema (includes the foundation schema) |
| `ODM1-3-1-foundation.xsd` | Core ODM type/element definitions |
| `xlink.xsd` | W3C XLink attributes referenced by ODM |
| `xml.xsd` | W3C `xml:` namespace attributes |
| `xmldsig-core-schema.xsd` | W3C XML-DSig (`ds:Signature`) referenced by ODM |

## Source

Downloaded from the CDISC reference repository:
`https://github.com/cdisc-org/DataExchange-ODM` → `archive/ODM1-3-1/`.

REDCap targets ODM **1.3.1** (`Classes/ODM.php`:
`xsi:schemaLocation="http://www.cdisc.org/ns/odm/v1.3 schema/odm/ODM1-3-1.xsd"`).

## Note on REDCap extensions

REDCap's ODM export adds vendor-extension attributes in the `redcap:`
namespace (`https://projectredcap.org`) — e.g. `redcap:RecordIdField`,
`redcap:UniqueEventName`. The base ODM 1.3.1 schema has **no `anyAttribute` hook**
on `SubjectData` / `StudyEventData`, so a raw REDCap export does **not** validate
against the unextended schema. The validator therefore strips `redcap:*`
attributes (and the `xmlns:redcap` declaration) in memory before running
`xmllint --schema`, which validates the genuine ODM hierarchy and required
attributes while ignoring the documented REDCap extensions.
