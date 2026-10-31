<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="index.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# Project index

Source: ISO/IEC/IEEE 42010:2022, entity of interest. The index is the short entry a later task opens first. It is not the architecture description.

## What it fixes

The name of the entity of interest, the purpose when a source states it, which later file to open, and which folders are suite output. It is the first picture when the shape of the project is not known yet.

## How to do it

1. Entity of interest: the name a source states (a README heading, a manifest name). If no source names it, use the repository folder name and cite that folder as the source.
2. Purpose: one sentence copied from a source. If no source states it, write "not observed". Do not infer it from the folder name.
3. Where to look next: one row per file already in this folder (`boundary`, `slice`, `map`, `recommendation`), with its `N` and state. If none exist, write "not observed".
4. The pointer is one sentence. Do not create a rule file. Translate the sentence with the artifact: "Read the accepted index in project-context/ before changing this project." When the output folder is not `project-context/`, name that folder instead. `/context-start` writes this same sentence into `AGENTS.md`.
5. Do not list layers, containers, or a stack.
6. Suite output. Look only at each direct child of the project root and at each path in `.cursor/adrenaline.json` under `outputDirs`. If that folder contains `ORIGIN.json`, read it. Keep a row when `suite` is `ADRenaline-Suite` and `plugin`, `repository`, and `convention` are present. The source is that `ORIGIN.json`. List those paths in `sources:` of this row in `STATUS.md`. Do not copy the artifacts into this index. Do not treat the folder as the product. Do not install the plugin because the folder exists. A folder with no `ORIGIN.json`, or with other fields, is not a row: do not infer it from the folder name. If no marker was read, one row says "not observed".

## Template

```markdown
# <NNN> — Index

- State: accepted | proposed
- Entity of interest: <name>
- Purpose: <sentence, or not observed>
- Read: <yyyy-MM-ddTHH:mm:ssZ>

## Where to look next

| Concern | File | State |
| --- | --- | --- |
| <concern or not observed> | <file or not observed> | <state or not observed> |

## Pointer

<one sentence>

## Suite output

| Folder | Plugin | Source |
| --- | --- | --- |
| <relative path, or not observed> | <plugin name, or not observed> | <ORIGIN.json path, or not observed> |

## Not observed

- <what was looked for and not found>
```

## Example

State: `accepted`. Entity of interest: Billing API, source `README.md`. Purpose: the sentence under that heading. Where to look next: not observed. Suite output: not observed. Not observed: modules, external systems, how to run.

## Prerequisites

None. A project whose shape is not known yet still gets this file.

## Prompts

There is no earlier command. The single prompt is the way.

In one message:

```text
/context-index
The README heading is the name. Leave the purpose as not observed if the README does not state it.
```

## Done

- Entity of interest, purpose, where to look next, the pointer, suite output, and not observed are present. Purpose is "not observed" when no source states it. The folder name was not turned into a purpose.
- No layer, container, or stack is listed. No rule file was written.
- The state is `accepted` when every claim cites a source or says "not observed".
- Suite output lists only folders whose `ORIGIN.json` was read and names `suite` `ADRenaline-Suite`, or one row of "not observed". No folder was inferred from its name. No artifact from those folders was copied into the index.
