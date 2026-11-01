<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="map.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# Context map

Source: Evans, *Domain-Driven Design* (2003), bounded context and context map. The Backstage system model (component `partOf` a system) is only the shape of the catalog: the detail stays in each project. This file is not a domain model and not a C4 landscape diagram.

## What it fixes

Which projects are in this workspace, and the relation a source shows between them. Models are not merged.

## How to do it

1. One row for this project. More rows only for projects the user named, or for a child directory of this workspace that contains its own `.git` or its own manifest. Do not scan outside the workspace.
2. Relation: a word the source uses. The allowed observed words are `shared-kernel`, `customer-supplier`, `conformist`, `anticorruption-layer`, `separate-ways`, `open-host-service`, `published-language`, and `part-of`. Use one only when a source names that relation or shows it (a submodule, a path dependency, a document that says it). Otherwise write "not observed". Do not pick a word by resemblance.
3. Each project keeps its own `adrenaline/project-context/` when that project is a separate repository. This file only points at the path.
4. Do not write one shared language for all rows.

## Template

```markdown
# <NNN> — Map

- State: accepted | proposed
- Read: <yyyy-MM-ddTHH:mm:ssZ>

| Project | Path | Entity of interest | Relation | Source |
| --- | --- | --- | --- | --- |
| <name> | <relative path> | <name or not observed> | <allowed word or not observed> | <path or not observed> |

## Not observed

- <relations or projects that were looked for and not found>
```

## Example

State: `accepted`. One row: `billing`, path `.`, entity of interest from the accepted index, relation "not observed", source the workspace folder. Not observed: a second project, any Evans relation.

## Prerequisites

None. One project is a valid map.

## Prompts

There is no earlier command.

In one message:

```text
/context-map
List this project. Add another only if it is in this workspace. Leave the relation as not observed unless a file shows it.
```

## Done

- Every row is a project that was named or found in this workspace. No project from outside was added.
- A relation is an allowed word with a source, or "not observed". A pattern was not chosen by resemblance.
- The models were not merged. No domain model and no diagram were written.
