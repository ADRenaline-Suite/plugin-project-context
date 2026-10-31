<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="slice.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# Context slice

Source: Martraire, *Living Documentation* (2019). A fact that already lives in a file is copied from that file, with the path and the time it was read.

## What it fixes

One concern: how to run, conventions, modules, or gaps. Each fact cites its source. A later task opens this file only when the index names that concern.

## How to do it

1. Pick one concern. The file name topic is that concern (`run`, `conventions`, `modules`, `gaps`, or the name the person used).
2. Read the files that hold the concern. One row per fact: the fact, the relative path, and the read time.
3. A statement with no source goes under Hypothesis and the state is `proposed`. Do not move it into Facts.
4. `STATUS.md` `notas` for this row: `sources: <path>, <path>; read: <yyyy-MM-ddTHH:mm:ssZ>`. No `|` inside `notas`.
5. Do not copy a whole file into the slice. One sentence per fact.
6. Do not write the domain model. That is `plugin-backend`.

## Template

```markdown
# <NNN> — <concern>

- State: accepted | proposed
- Concern: <run | conventions | modules | gaps | name>
- Read: <yyyy-MM-ddTHH:mm:ssZ>

## Facts

| Fact | Source | Read |
| --- | --- | --- |
| <one sentence> | <relative path> | <yyyy-MM-ddTHH:mm:ssZ> |

## Hypothesis

- <statement with no source, or not observed>

## Not observed

- <what was looked for and not found>
```

## Example

State: `accepted`. Concern: `run`. Fact: the test script is `vitest`, source `package.json`, key `scripts.test`. Hypothesis: not observed. `notas`: `sources: package.json; read: 2026-10-30T22:30:00Z`.

## Prerequisites

- **Source.** A file that was read and states the fact. If the concern has no such file, write nothing for this piece.

## Prompts

In one message:

```text
/context-slice run
Source: package.json scripts. Leave a concern with no file as not written.
```

There is no earlier command.

## Done

- The concern is one, and every Facts row has a path and a read time. A statement with no source is under Hypothesis and the state is `proposed`.
- `notas` lists `sources:` and `read:` for the paths in Facts. The slice does not paste the source file.
- No domain model was written. With no source, no file was written.
