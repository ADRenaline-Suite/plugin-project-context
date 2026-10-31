<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="start.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# First picture

Source: the same as [index.md](index.md) and [boundary.md](boundary.md). This situation is the first scan. It is not a slice and not a recommendation.

## What it fixes

The index and the boundary, in one step, including when the shape of the project is not known yet.

## How to do it

1. Write the index with the template and the rules in [index.md](index.md).
2. Write the boundary with the template and the rules in [boundary.md](boundary.md). Each file has its own `<NNN>`.
3. The index "Where to look next" names the boundary file from this turn.
4. Stop. Do not write a slice, a map, or a recommendation.
5. The session hook does not do this step. It only marks drift after these files exist.

## Template

Use the template in [index.md](index.md) and the template in [boundary.md](boundary.md). Do not invent a third file.

## Example

A repository whose `README.md` heading names the project and whose first paragraph states the purpose. `/context-start` writes `001-index-<topic>.md` and `002-boundary-<topic>.md`, both `accepted`. Purpose comes from that paragraph. External entities are "not observed" when no file names one. No slice.

## Prerequisites

None. A project whose shape is not known yet still gets both files.

## Prompts

There is no earlier command. The single prompt is the way.

In one message:

```text
/context-start
Write the index and the boundary. Leave not observed where no file states it. Stop there.
```

## Done

- The index and the boundary from this turn exist, each with its own `<NNN>`. The index names the boundary under where to look next.
- No slice, map, or recommendation was written. No purpose or external entity was inferred.
- Both states are `accepted` only when every claim cites a source or says "not observed".
