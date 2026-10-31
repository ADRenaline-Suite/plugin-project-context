<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="start.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# First picture

Source: the same as [index.md](index.md), [boundary.md](boundary.md), [slice.md](slice.md), [map.md](map.md), and [recommendation.md](recommendation.md). This situation is the first scan. It is not a refresh.

## What it fixes

The first picture in one step: the index, the boundary, a slice for each concern that has a source, the map, and the recommendation when a signal was read. It includes a project whose shape is not known yet.

## How to do it

1. Read the project. Decide which of `run`, `conventions`, `modules`, and `gaps` has a source that was read, and whether [recommendation.md](recommendation.md) has a signal.
2. Write the files in this order. Each one takes the next free `<NNN>` and follows that reference: the index ([index.md](index.md)), the boundary ([boundary.md](boundary.md)), each slice that has a source ([slice.md](slice.md), in the order `run`, `conventions`, `modules`, `gaps`), the map ([map.md](map.md)), and the recommendation ([recommendation.md](recommendation.md)) when a signal was read.
3. The index "Where to look next" names every other file this turn writes, with its `N` and state. Fill that table in this same delivery, before close.
4. A concern with no source writes no file and uses no `<NNN>`. A recommendation with no signal writes no file. Say which ones were not written.
5. Write the pointer sentence from [index.md](index.md) into `AGENTS.md` at the project root, in the language of the artifact. If that sentence is already in the file, leave the file. If `AGENTS.md` is missing, create it with that sentence only. If it exists, append a blank line and the sentence at the end. Do not rewrite the rest of the file. Do not create a rule file.
6. Stop. Do not refresh. The session hook does not do this step. It only marks drift after these files exist.

## Template

Use the template of each reference named above. Do not invent another kind of file.

## Example

A repository whose `README.md` heading names the project and whose first paragraph states the purpose, with no other source. `/context-start` writes `001-index-<topic>.md` and `002-boundary-<topic>.md`, both `accepted`, and `003-map-<topic>.md` with one row and relation "not observed". The index names `002` and `003`. Suite output: not observed. No slice: none of the four concerns has a source. No recommendation: no signal was read.

## Prerequisites

None. A project whose shape is not known yet still gets the index, the boundary, and the map.

## Prompts

There is no earlier command. The single prompt is the way.

In one message:

```text
/context-start
Write the index, the boundary, each slice that has a source, the map, and the recommendation when a signal was read. Leave a concern with no source, and a recommendation with no signal, unwritten. Do not refresh.
```

## Done

- The index, the boundary, and the map from this turn exist, each with its own `<NNN>`. The index names every other file this turn wrote.
- A slice exists only for a concern whose source was read. A recommendation exists only when a signal was read, and its state is `proposed`.
- No refresh was written. No purpose, external entity, or Evans relation was inferred.
- `AGENTS.md` at the project root contains the pointer sentence once. The rest of that file was not rewritten. No rule file was written.
- `accepted` is used only when every claim cites a source or says "not observed".
- The index lists suite output from each `ORIGIN.json` that was read, or one "not observed" row. No folder was inferred from its name.
