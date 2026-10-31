<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="boundary.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# Project boundary

Source: Rozanski and Woods, *Software Systems Architecture*, 2nd ed. (2011), Context viewpoint; C4 level 1 (https://c4model.com/diagrams/system-context). The system stays a closed box. This file is not a C4 diagram and not an architecture description.

## What it fixes

What is inside the entity of interest, what is outside, and which external entities a source names.

## How to do it

1. Inside: the repository, or the part a source marks as this system. Cite the source.
2. Outside: what a source places beyond that box. If none does, write "not observed".
3. External entities: people and systems a source names, with the relation in the source's words. One row per entity. No row when none was named; the section says "not observed".
4. Do not open the box. Do not name containers, databases, or protocols that a source did not name.
5. Do not draw. A diagram is asked of `plugin-uml-diagrams`. An architecture description is asked of `plugin-software-architect`.

## Template

```markdown
# <NNN> — Boundary

- State: accepted | proposed
- Entity of interest: <name>
- Read: <yyyy-MM-ddTHH:mm:ssZ>

## Inside

- <what is in scope> — <source>

## Outside

- <what is out of scope, or not observed> — <source or not observed>

## External entities

| Entity | Relation | Source |
| --- | --- | --- |
| <name or not observed> | <words from the source, or not observed> | <path or not observed> |

## Not observed

- <what was looked for and not found>
```

## Example

State: `accepted`. Inside: the `billing/` repository, source the folder. Outside: not observed. External entities: not observed. Not observed: users, upstream systems, interfaces.

## Prerequisites

None. The entity name may come from an accepted index. If there is no index, use the repository folder name and cite it.

## Prompts

There is no earlier command.

In one message:

```text
/context-boundary
Keep the box closed. Write not observed where no file names an external entity.
```

## Done

- Inside, outside, external entities, and not observed are present. An external entity that was not in a source was not added.
- The box stays closed: no container, database, or protocol that a source did not name.
- No diagram and no ADR were written. The state is `accepted` when every claim cites a source or says "not observed".
