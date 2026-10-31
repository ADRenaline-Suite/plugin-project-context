<p align="right">Language:&emsp;<img alt="English" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-en-on.svg" align="middle" style="vertical-align:middle"> <a href="recommendation.es.md" style="vertical-align:middle"><img alt="Español" src="https://raw.githubusercontent.com/ADRenaline-Suite/.github/main/profile/lang-es-off.svg" align="middle" style="vertical-align:middle"></a></p>

[🏠 Project Context](../../../README.md) / [Maintain the context](../SKILL.md)

# Plugin recommendation

Source: the suite catalog in `doc/arch/adr-003-profesiones-areas-catalogo.md` when that file is present. The names below are that catalog. There is no external standard for this list. A row is a recommendation, not an install.

## What it fixes

Which ADRenaline plugins match a signal that was read, and the path of that signal. The state stays `proposed` until the user says this is the list to follow.

## How to do it

1. Read files. Add a row only when the signal in the table was read in that file.
2. Do not add a plugin that the table does not list for that signal. Do not recommend `plugin-project-context`.
3. The state of the file is `proposed`. Do not mark it `accepted` unless the user says these plugins are the ones to follow. That acceptance amends the same file only when the user asks to amend it.
4. Do not install, clone, or copy a plugin. Do not write its skill into this project.
5. `notas`: `sources: <path>, <path>; read: <yyyy-MM-ddTHH:mm:ssZ>`. No `|` inside `notas`.

## Signals

| Signal that was read | Plugin |
| --- | --- |
| `openapi.yaml`, `openapi.json`, or `swagger.json` | `plugin-apis` |
| A UI dependency in a manifest (`react`, `vue`, `angular`, `svelte`) or an `index.html` that loads an application script | `plugin-frontend` |
| A file of interface copy, voice, or a UI glossary, and no request to design the screen | `plugin-ux-writing` |
| `Dockerfile`, a compose file, a Helm chart, or a pipeline file that builds or promotes | `plugin-platform` |
| A file that states an SLO or an error budget | `plugin-sre` |
| A threat model, an ASVS note, or a security requirement file | `plugin-security` |
| A privacy record or a file that lists personal data | `plugin-privacy` |
| `.puml` or a folder of UML sources | `plugin-uml-diagrams` |
| A WCAG note, an axe config, or an accessibility requirement | `plugin-accessibility` |
| A domain model the user asks to record, or a server entry with no UI signal | `plugin-backend` |
| A schema or migration for operational data | `plugin-data` |
| OpenTelemetry config, or a metrics, traces, or logs exporter | `plugin-observability` |
| A call to a model API, a retrieval index, or a tool definition for a model | `plugin-genai` |
| A model card or a risk note for a model | `plugin-ai-governance` |
| A training script or a training config | `plugin-model-training` |
| An evaluation set with a metric for a model | `plugin-ai-evaluation` |
| A dataset sheet for training or retrieval | `plugin-ai-data` |
| An experiment hypothesis with a unit and a decision rule | `plugin-experimentation` |
| A model registry, a promotion rule, or a rollback note for a model | `plugin-mlops` |
| Product events that compute a metric | `plugin-product-analytics` |
| A problem, an opportunity, or a business outcome the user asks to record | `plugin-product` |
| A use case (actor, main flow) the user asks to record | `plugin-project-manager` |
| A test scenario or a test plan file | `plugin-qa-engineer` |
| A screen specification or a design file | `plugin-ui-ux-design` |
| A Diátaxis document the user asks to write for a reader | `plugin-documentation` |
| An ADR or an architecture evaluation the user asks to write | `plugin-software-architect` |

## Template

```markdown
# <NNN> — Recommendation

- State: proposed
- Read: <yyyy-MM-ddTHH:mm:ssZ>

| Plugin | Signal | Source |
| --- | --- | --- |
| <plugin-name> | <signal from the table> | <relative path> |

## Not observed

- <signals that were looked for and not found>

## Follows when accepted

The user has not accepted this list. Nothing was installed.
```

## Example

State: `proposed`. One row: `plugin-apis`, signal `openapi.yaml`, source `openapi.yaml`. Not observed: a UI dependency, a pipeline. Nothing installed.

## Prerequisites

- **Signal.** At least one row of the table matched a file read in this turn. If none matched, write nothing for this piece.

## Prompts

In one message:

```text
/context-recommend
Use only a signal from the table. Leave the file proposed.
```

There is no earlier command.

## Done

- Every row is a table signal that was read, with the path. No plugin was added by resemblance. `plugin-project-context` is absent.
- The state is `proposed`, unless the user asked to amend this file to `accepted`. Nothing was installed or copied.
- With no matching signal, no file was written.
