#!/usr/bin/env python3
"""Regenerate staging_vs_redcap_val_feature_diff.md.

Compares feature files changed on origin/staging since its merge-base with
origin/redcap_val, splits them into needed / not needed (unused modules), and
tags each needed modified file by the kind of change it contains.

Usage (from the repo root, after `git fetch origin staging redcap_val`):
    python3 staging_vs_redcap_val_feature_diff.py [output.md]

Overwrites the output file. Sections added to the md by hand (e.g. the
"Merge outcome" section from the 2026-10-16 sync) are not generated, so write
to a new file and copy them across if you need them.
"""
import datetime, os, re, subprocess, sys
from collections import Counter

REPO = os.path.dirname(os.path.abspath(__file__))
OUT = sys.argv[1] if len(sys.argv) > 1 else os.path.join(REPO, 'staging_vs_redcap_val_feature_diff.md')
VAL, STAGING = 'origin/redcap_val', 'origin/staging'

# Modules we don't use: (label, path regex). Edit this list to change what counts as "not needed".
NOT_NEEDED = [
    ('Access Control Groups_33', r'/(Access Control Groups|AccessControlGroup)_33/'),
    ('A/Project Administrator Groups_67', r'/A/Project Administrator Groups_67/'),
    ('C/CDIS_31', r'/C/CDIS_31/'),
    ('D/CDIS_31', r'/D/(CDIS|CDSI)_31/'),
    ('D/MOSIO_97', r'/D/MOSIO_97/'),
]

# Step patterns, matched against lines removed on staging.
DEPRECATED = re.compile(
    r'dialog containing the following text|select the submit option labeled|Choices? of .* dialog box|from arm name'
    r'|request created for the project named|report in the My Reports|element containing the following text'
    r'|date picker widget on the field labeled')
REMOVED = re.compile(
    r'(field|textarea field)( in the Matrix column)? (labeled exactly|within the Record Locking Customization table'
    r'|for the Discrepant field labeled|for the field labeled) '
    r'|input field labeled "[^"]*" (within|on|in) ')
TEST_FIX = re.compile(r'ChangesOR|^\s*\|\||into the input field labeled "Password:"|wait for another'
                      r'|wait for \d+ (second|minute)s?\s*$|wait for background processes|#Manual: this may take')
HOUSEKEEPING = re.compile(r'^\s*#|^\s*Feature:|This scenario is fully tested')
WAIT = re.compile(r'wait for \d+ (second|minute)s?\s*$|# ?Wait for ')
SCENARIO = re.compile(r'\s*Scenario')
# Files whose only change is added assertions (no removed lines), judged by hand.
ADDED_ONLY_TEST_FIX = {'A.2.2.0400. - Delete.feature', 'C.3.30.0900. - Randomization lock.feature'}

ORDER = ['new-test', 'rctf-deprecated', 'rctf-removed', 'core', 'test-fix', 'housekeeping']


def git(*a):
    return subprocess.run(['git', '-C', REPO, '-c', 'core.quotePath=false', *a],
                          capture_output=True, text=True, check=True).stdout


def not_needed(path):
    for label, rx in NOT_NEEDED:
        if re.search(rx, path):
            return label
    return None


def folder(path):
    p = path.split('/')
    return f'{p[1]}/{p[2]}'


def diff_lines(base, path):
    d = git('diff', '-U0', base, STAGING, '--', path).splitlines()
    rem = [l[1:] for l in d if l.startswith('-') and not l.startswith('---') and l[1:].strip()]
    add = [l[1:] for l in d if l.startswith('+') and not l.startswith('+++') and l[1:].strip()]
    return rem, add


def tag(path, rem, add):
    t = set()
    for l in rem:
        if DEPRECATED.search(l):
            t.add('rctf-deprecated')
        elif REMOVED.search(l):
            t.add('rctf-removed')
        elif TEST_FIX.search(l):
            t.add('test-fix')
        elif HOUSEKEEPING.search(l):
            t.add('housekeeping')
        else:
            t.add('core')
    if sum(1 for l in add if SCENARIO.match(l)) > sum(1 for l in rem if SCENARIO.match(l)):
        t.add('new-test')
    if any(WAIT.search(l) for l in add):
        t.add('test-fix')
    if not rem:
        if path.split('/')[-1] in ADDED_ONLY_TEST_FIX:
            t.add('test-fix')
        elif all(HOUSEKEEPING.search(l) for l in add):
            t.add('housekeeping')
        else:
            t.add('core')
    return [x for x in ORDER if x in t]


base = git('merge-base', VAL, STAGING).strip()
ahead = git('rev-list', '--count', f'{VAL}..{STAGING}').strip()
behind = git('rev-list', '--count', f'{STAGING}..{VAL}').strip()

changes = []  # (status, path, new_path_or_None, score)
for row in git('diff', '-M', '--name-status', f'{VAL}...{STAGING}', '--', '*.feature').splitlines():
    cols = row.split('\t')
    st = cols[0]
    changes.append((st[0], cols[1], cols[2] if len(cols) > 2 else None, st))

need = {k: [] for k in 'AMDR'}
nn = {k: {} for k in 'AMDR'}
for st, p, newp, score in changes:
    label = not_needed(newp or p)
    if label:
        nn[st].setdefault(label, []).append((p, newp, score))
    else:
        need[st].append((p, newp, score))

# Tag needed modified files
tags, new_tests = {}, []
for p, _, _ in need['M']:
    rem, add = diff_lines(base, p)
    tags[p] = tag(p, rem, add)
    if 'new-test' in tags[p]:
        removed_sc = {l.strip() for l in rem if SCENARIO.match(l)}
        new_tests.append((p, [l.strip() for l in add if SCENARIO.match(l) and l.strip() not in removed_sc]))
per_tag = Counter(x for v in tags.values() for x in v)
combos = Counter(', '.join(v) for v in tags.values())

# redcap_val features still using step phrasing removed from rctf
broken = Counter()
for row in git('grep', '-n', '-E', REMOVED.pattern, VAL, '--', '*.feature').splitlines():
    path = row.split(':', 2)[1]
    if not not_needed(path):
        broken[path.split('/')[-1]] += 1

fixtures = [l for l in git('diff', '--diff-filter=A', '--name-only', f'{VAL}...{STAGING}', '--', 'Files').splitlines()]
val_only = Counter(r.split('\t')[0][0] for r in git('diff', '-M', '--name-status', f'{STAGING}...{VAL}', '--', '*.feature').splitlines())


def n_nn(st):
    return sum(len(v) for v in nn[st].values())


out = []
w = out.append
w('# Feature file changes: `staging` vs `redcap_val` (redcap_rsvc)')
w('')
w(f'Generated {datetime.date.today()}. Changes made on `{STAGING}` since the merge-base with `{VAL}` (`{base[:8]}`).')
w(f'Staging is {ahead} commits ahead; redcap_val is {behind} commits ahead.')
w('')
w('Regenerate: `git fetch origin staging redcap_val && python3 staging_vs_redcap_val_feature_diff.py`')
w('')
w('**Summary** — "Not needed" = modules not used: ' + ', '.join(l for l, _ in NOT_NEEDED) + '.')
w('')
w('| Change | Total | Not needed | Needed |')
w('|---|---|---|---|')
for st, name in [('A', 'Added'), ('M', 'Modified'), ('D', 'Deleted'), ('R', 'Renamed')]:
    w(f'| {name} | {len(need[st]) + n_nn(st)} | {n_nn(st)} | {len(need[st])} |')
tot_nn = sum(n_nn(s) for s in 'AMDR'); tot_need = sum(len(need[s]) for s in 'AMDR')
w(f'| **Total** | **{tot_nn + tot_need}** | **{tot_nn}** | **{tot_need}** |')
w('')
w('Contents: [Needed](#needed) · [Not needed](#not-needed) · [redcap_val-only changes](#note-redcap_val-only-changes)')
w('')
w('---')
w('')
w('# Needed')
w('')
w(f"## Added ({len(need['A'])})")
w('')
out += [f'- {p}' for p, _, _ in need['A']]
w('')
w(f"## Deleted ({len(need['D'])})")
w('')
out += [f'- {p}' for p, _, _ in need['D']]
w('')
added_names = [p.split('/')[-1] for p, _, _ in need['A']]
for p, _, _ in need['D']:
    code = p.split('/')[-1].split(' - ')[0]
    if any(a.startswith(code) and 'REDUNDANT' in a for a in added_names):
        w(f'> {code} was replaced by a `... - REDUNDANT.feature` placeholder (see Added).')
        w('')
if need['R']:
    w(f"## Renamed ({len(need['R'])})")
    w('')
    out += [f'- `{p}` → `{q}` ({s})' for p, q, s in need['R']]
    w('')
w(f"## Modified ({len(need['M'])})")
w('')
w('### Nature of modifications')
w('')
w('Each needed modified file below is tagged with every kind of change it contains (a file can carry several tags):')
w('')
w('| Tag | Meaning | Files |')
w('|---|---|---|')
for t, meaning in [
    ('new-test', 'Adds new test scenario(s) to an existing feature file'),
    ('rctf-deprecated', 'Replaces rctf steps flagged `@deprecated` (still work today)'),
    ('rctf-removed', 'Replaces step phrasing **removed** from rctf — the redcap_val version is broken now'),
    ('core', 'Matches REDCap core changes (labels, tables, logging format, row order, PDF text)'),
    ('test-fix', 'Test corrections not driven by REDCap or rctf (typos, wrong test data, extra assertions, waits)'),
    ('housekeeping', 'Comments, REDUNDANT markers, Feature title wording'),
]:
    w(f'| `{t}` | {meaning} | {per_tag[t]} |')
w('')
w('<details><summary>Tag combinations (each file counted once)</summary>')
w('')
w('| Combination | Files |')
w('|---|---|')
out += [f'| `{c}` | {n} |' for c, n in combos.most_common()]
w(f'| **Total** | **{len(tags)}** |')
w('')
w('</details>')
w('')
w('#### rctf steps replaced on staging')
w('')
out += [
    '| Old step (as used on redcap_val) | rctf status | Replacement on staging |',
    '|---|---|---|',
    '| `I should see a dialog containing the following text: "…"` | deprecated | `I should see "…"` (sometimes plus `I click on the button labeled "Okay"`) |',
    '| `I select the submit option labeled "…" on the Data Collection Instrument` | deprecated | `I click on the button labeled "Save & Exit Form"`, or `"More save options"` → `I click on the link labeled "…"` |',
    '| `I enter Choices of "…" into the open "Edit Field" dialog box` | deprecated | `I enter "…" in the textarea field labeled "Choices"` |',
    '| `I select record ID "1" from arm name "…" on the Add / Edit record page` | deprecated | `I select "1" on the dropdown field labeled "select record"` |',
    '| `I should see / click on the "process request" icon for the "…" request created for the project named "…" within the "Pending Requests" table` | deprecated | `I click on the icon labeled "Actions"` / `"Approve request"` `in the row labeled "…"` |',
    '| `I click on the "View Report" button for the "…" report in the My Reports & Exports table` | deprecated | `I click on the button labeled "View Report" in the row labeled "…"` |',
    '| `I click the element containing the following text: "…"` | deprecated | `I click on "…"` |',
    '| `I click on the date picker widget on the field labeled "…"` | deprecated | `I click on the icon labeled "Click to select a date/time" in the row labeled "…"` |',
    '| `… field in the Matrix column labeled exactly "…"` | **removed** | `… field in the Matrix column labeled "…"` |',
    '| `… textarea field within the Record Locking Customization table for the Data Collection Instrument named "…"` | **removed** | generic textarea step |',
    '| `… input field labeled "…" within the data collection instrument list` | **removed** | `… input field labeled "…"` |',
    '',
]
if broken:
    w('> **Broken on redcap_val now:** rctf commit `adefdba` (2026-06-29, "Removed language that did not actually affect the action of certain text field steps") '
      'dropped `labeled exactly`, `within the Record Locking Customization table for the Data Collection Instrument named`, `for the Discrepant field labeled`, '
      '`for the field labeled` and the trailing base-element suffix on input-field steps. redcap_val features still using them (undefined steps): '
      + ', '.join(f'{f.replace(".feature", "")} ({n})' for f, n in broken.most_common()) + '.')
    w('')
if new_tests:
    w('> **New tests inside modified files:** ' + '; '.join(
        f"{p.split('/')[-1].replace('.feature', '')} adds " + ', '.join(f'`{s}`' for s in sc) for p, sc in new_tests) + '.')
    if fixtures:
        w('> Fixture files added on staging (check which new scenarios need them): ' + ', '.join(f'`{f}`' for f in fixtures) + '.')
    w('')
w('> `core` edits assume a recent REDCap core UI; verify against the REDCap version you run before applying.')
w('')
cur = None
for p, _, _ in need['M']:  # git lists paths sorted, so each folder is contiguous
    if folder(p) != cur:
        if cur:
            w('')
        cur = folder(p)
        w(f'### {cur}')
        w('')
    w(f"- {p.split('/')[-1]} `[{', '.join(tags[p])}]`")
w('')
w('---')
w('')
w('# Not needed')
w('')
w('These modules are not used, so their changes can be skipped:')
w('')
w('| Module | Added | Renamed | Modified |')
w('|---|---|---|---|')
for label, _ in NOT_NEEDED:
    a, r, m = (len(nn[s].get(label, [])) for s in 'ARM')
    if a or r or m:
        w(f'| {label} | {a} | {r} | {m} |')
w('')
for st, name in [('A', 'Added'), ('R', 'Renamed'), ('M', 'Modified'), ('D', 'Deleted')]:
    if not n_nn(st):
        continue
    w(f'## {name} ({n_nn(st)})')
    w('')
    for label, _ in NOT_NEEDED:
        items = nn[st].get(label)
        if not items:
            continue
        w(f'#### {label} ({len(items)})')
        w('')
        for p, q, s in items:
            w(f'- `{p}` → `{q}` ({s})' if q else f'- {p}')
        w('')
w('---')
w('')
w('## Note: redcap_val-only changes')
w('')
w('redcap_val also has its own feature changes not on staging: '
  + ', '.join(f'{val_only[k]} {k}' for k in 'AMDR' if val_only[k]) + ' — these may conflict on merge.')
w('')

open(OUT, 'w').write('\n'.join(out))
print(f'Wrote {OUT}: needed {tot_need}, not needed {tot_nn}; tags {dict(per_tag)}')
