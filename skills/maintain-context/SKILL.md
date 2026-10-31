---
name: maintain-context
description: Records the current picture of a project, one slice at a time, and publishes a new snapshot when a cited source changes. Use it when the agent needs the boundary, the facts, or the ADRenaline plugins that fit, including when the project's shape is not known yet or when several projects share a workspace.
---

<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="SKILL.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../README.md)

# Maintain the context

Record a picture of the project that a later task can open without loading the whole repository. The picture is an index, a boundary, and short slices. Each accepted fact cites the file it was read from.

Source: ISO/IEC/IEEE 42010:2022 (entity of interest and environment); Rozanski and Woods, *Software Systems Architecture*, 2nd ed. (2011), Context viewpoint; C4 level 1 and the system landscape (https://c4model.com/diagrams/system-context); Evans, *Domain-Driven Design* (2003), bounded context and context map; Martraire, *Living Documentation* (2019), one source of truth and a new published snapshot. Suite plugin names come from `doc/arch/adr-003-profesiones-areas-catalogo.md` when that file is in the workspace. They are not an external practice.

## Before writing

1. Read only the reference for this situation: [start](references/start.md), [index](references/index.md), [boundary](references/boundary.md), [slice](references/slice.md), [map](references/map.md), [recommendation](references/recommendation.md), or [refresh](references/refresh.md).
2. A command names one reference. Write that situation only. `/context-start` is the situation that writes the index and the boundary.
3. A request that asks for the picture of a project and names no command does the same as `/context-start`: the index and the boundary, each with its own `<NNN>`, and then stops. It does not write a slice, a map, or a recommendation.
4. Do not draw a diagram, write an ADR, write a domain model, write a reader-facing document, or copy another plugin's skill. Ask that plugin when the request is its artifact.
5. Do not install a plugin. Do not write `.cursor/rules`, agents, commands, or skills. The index may contain one pointer sentence. The person copies it if they want it.

## Language

The instructions stay in English. Write the artifact in the language of the request. If the request names a language, use that one. Otherwise use the language the request is written in. Keep names the person already used. Translate the headings of the reference template and keep the same fields. The type in the file name stays the English piece id (`index`, `boundary`, `slice`, `map`, `recommendation`). `STATUS.md` columns stay `N`, `archivo`, `estado`, `sustituye`, `notas`. The reply uses that same language. The prompts in the reference are the English wording: show them in the language of the request and keep the command names.

## When a prerequisite is missing

Three checks stop the delivery. Write no files for that piece. Reply with only this, in the language of the request:

1. "Missing:" and the names that are missing.
2. "In one message:" and the single prompt from the reference. Fill it with what the person already said. Where a value is missing, leave the gap (`#…`).
3. "Or, in this order:" and the earlier commands that are still missing, in the order of the reference, each with its prompt. Omit this block if there is no earlier command.

Those three are: a slice whose concern has no source that was read; a recommendation with no signal from [references/recommendation.md](references/recommendation.md); a refresh when the output folder has no `STATUS.md`.

The index, the boundary, and the map do not stop. What was not read is the words "not observed". A hypothesis with no source stays `proposed`.

## Delivery

The folder is `project-context/` at the project root. If `.cursor/adrenaline.json` has `outputDirs["plugin-project-context"]` set to a relative path, without `..` and not absolute, use that path. If the file, the key, or a valid path is missing, use `project-context/` and, in the last case, say so. Create the folder if it does not exist. Do not write outside it.

The file is `<NNN>-<type>-<topic>.md`. `<NNN>` is the next free integer, three digits, and it is not reused. `<type>` is the English piece id.

Keep `<folder>/STATUS.md` with columns `N`, `archivo`, `estado`, `sustituye`, and `notas`.

`notas` for a slice or a recommendation lists `sources: <relative path>, <relative path>; read: <UTC timestamp>` using `yyyy-MM-ddTHH:mm:ssZ`. Do not put `|` inside `notas`: it breaks the `STATUS.md` table. Paths are relative to the project root, with no `..`. A judgment row (index purpose, boundary, recommendation) uses the same `sources:` and `read:` when a file was read. The session hook reads those notes and may append `drift:`. It does not change `estado` and it does not write a new file.

If the topic already has a file:

- The user asks to amend that same file: edit it, keep the `<NNN>`, and keep `accepted` if it already was.
- A cited source changed and this situation republishes the fact: next `<NNN>`, the previous row becomes `superseded` (`sustituye` points at the new `N`).
- New topic: next `<NNN>`.

`proposed` for a hypothesis and for every recommendation until the user says that list is the one to follow. `accepted` for a fact that cites a source, including an explicit "not observed". `deprecated` if it stays readable and is no longer preferred, with no file that replaces it. `superseded` when another file replaces it. When you close, say the folder, the file, the `N`, and the state.

## Done

Before you close, evaluate this list and the `## Done` list in the reference for this situation. A command fixes the situation: use the reference that command names. Every item is true, or you fix the delivery in this turn. Do not leave a file that fails an item. Do not mark it `accepted` while an item fails. A template the reference names is applied and recorded under Assumed; the delivery uses the state that reference names. A prerequisite that still stops the delivery is not a failed list: follow "When a prerequisite is missing" and write no files for that piece.

- The situation of this turn is the only one written, unless the request asked for two. Each delivery has its own `<NNN>`.
- Files are only in the output folder, named as Delivery says. `<NNN>` is not reused. `STATUS.md` matches the files and the state this situation allows. A gap the reference leaves as `proposed` stays `proposed`.
- The artifact language matches the request. `STATUS.md` columns stay `N`, `archivo`, `estado`, `sustituye`, `notas`.
- Every field the template requires is filled. No placeholder remains (`#…`, `<task>`, `TBD`, lorem ipsum). A field the reference tells you to leave blank until data arrives is blank on purpose, and the state is the one the reference names.
- Nothing this skill forbids was added. The reference names what stays out.
- The reply names the folder, the files, the `N`, and the state. If a template was applied, the reply ends with the Assumed block, one line per template, naming the command that changes it and the command that regenerates this piece. A blank left on purpose names the command that fills it.

## Example

Input: a repository folder `billing/` whose `README.md` heading is "Billing API", with no other source files. The request is "what is this project?", written in English, and it names no command.

`accepted` output: `001-index-billing.md` (entity of interest Billing API, source `README.md`; modules "not observed") and `002-boundary-billing.md` (inside: this repository; outside and external entities: "not observed"). No slice and no recommendation. The reply names `project-context/`, both files, `001` and `002`, and `accepted`.
