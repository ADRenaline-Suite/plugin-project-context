<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="refresh.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# Context refresh

Source: Martraire, *Living Documentation* (2019). The published file is a snapshot. A change publishes the next one. The suite rule is the same: the next `<NNN>`, and the previous row `superseded` (`doc/arch/adr-001-estado-numeros-inmutabilidad.md`).

## What it fixes

The slices whose cited sources changed, and a drift note on a judgment that a hook or this command found stale. It does not accept a new purpose, boundary, or recommendation by itself.

## How to do it

1. Read `STATUS.md`. If it is missing, write nothing.
2. For each `accepted` slice, read the paths in `notas` (`sources:`).
3. If those files are unchanged, leave the row.
4. If an extracted fact in a slice changed, write the next `<NNN>` for that concern, mark the previous row `superseded`, and mark the new row `accepted`. Update `read:`.
5. If the accepted index names a file that this turn superseded, write the next index so "Where to look next" points at the new file, and supersede the previous index. That pointer is a fact, not a new purpose.
6. Read `ORIGIN.json` in each direct child of the project root, in each direct child of `adrenaline/` at that root, and in each `outputDirs` path of `.cursor/adrenaline.json`. A path found twice is one row. Do not walk any other directory. `adrenaline/` itself is not a row. If the accepted index has no Suite output section, or its rows do not match those files, write the next index. Keep the purpose and the pointer. Update suite output and, when this turn also superseded a file, where to look next. Supersede the previous index. A missing or invalid marker is not a row. Do not infer a folder from its name.
7. If a source cited by an index purpose, a boundary, or a recommendation changed, do not rewrite that judgment. Append `drift: <path>` in `notas` when it is not already there. Leave `estado` as it is. The reply names the command that republishes it: `/context-index`, `/context-boundary`, or `/context-recommend`.
8. Do not amend an `accepted` file in place unless the user asked to amend that same file.
9. The session hook may already have written `drift:`. This command still re-reads the source before publishing a slice. The hook's note is not a new snapshot.

## Template

A republished slice uses the template in [slice.md](slice.md). A republished index uses the template in [index.md](index.md). A drift note does not have its own file.

## Example

`003-slice-run.md` is `accepted` with `sources: package.json; read: 2026-10-30T22:30:00Z`. `package.json` now says `vitest run`. The refresh writes `004-slice-run.md` (`accepted`) and sets `003` to `superseded`, `sustituye` `004`. The boundary row is untouched.

## Prerequisites

- **STATUS.md.** An output folder that already has `STATUS.md`. If it does not, write nothing.

## Prompts

In one message:

```text
/context-refresh
Republish a slice whose source changed. Leave a judgment as it is and name the drift.
```

Or, in this order:

```text
/context-index
```

## Done

- An unchanged source left its row in place. A changed slice fact is a new `<NNN>`, and the previous row is `superseded`.
- A changed purpose, boundary, or recommendation was not rewritten. `drift:` names the path, and the reply names the command that republishes that judgment.
- No `accepted` file was edited in place. The hook's note was not treated as a new snapshot. With no `STATUS.md`, no file was written.
- A suite-output set that differs from the accepted index is a new index `<NNN>`. The purpose was not changed. A folder without `ORIGIN.json` was not added.
