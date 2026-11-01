---
name: context-help
description: "ADRenaline. Help: catalog of plugin-project-context (skills, rules, commands)."
---

# Help — ADRenaline Project Context

Print this catalog as the reply. Do not run any skill or command. Do not invent entries that are not listed. If a component was added to the plugin and is missing here, add one line from its frontmatter `description` and say the catalog was refreshed.

When this help command is the first command in the message, every command, skill, or rule named after it is the subject of the help. Do not run those names. Do not print the full catalog. For each name, in the order given, print its catalog line (the linked id and the sentence). When the README has a heading for that command, also print the paragraphs under that heading, up to the next heading. A skill name uses the skill's catalog line and the README group that names that skill, up to its first command heading. A name that is not in this catalog is one line: it is not in this plugin. Do not invent what it does, and do not write a file.

Write the sentences in the language of the request. Keep command names, file ids, and every URL unchanged. Every id is a markdown link to the GitHub URL on its line. Do not print a repository `name` as the visible label of a plugin.

Keep the section headings, in this order: Plugin, Commands, Skills, Rules, then Agents, Hooks, and MCP when the plugin has them, then Output, then Not in this plugin. The title and the Plugin line show `ADRenaline` plus the `displayName`, then one sentence on what the plugin does. Under Commands, group the lines by the skill named in the line. Each group opens with that skill name linked to its SKILL.md. One line per item: the linked id, then the sentence. Output links this plugin's GitHub repository under that same label. A plugin under Not in this plugin uses `ADRenaline` plus its short name, and links to `https://github.com/<owner>/<other-plugin>` only when that repository exists.

## Plugin

- [**ADRenaline Project Context**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/README.md) — Records a current picture of a project: its boundary, the facts with their sources, and which ADRenaline plugins fit, then refreshes that picture when a source changes.

## Commands

- [**/context-help**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/README.md) — This help (one-line catalog of the plugin).
- [**/context-start**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/start.md) — First picture (skill maintain-context): the index, the boundary, each slice that has a source, the map, and the recommendation when a signal was read. It writes one pointer sentence into AGENTS.md. It does not refresh.
- [**/context-index**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/index.md) — Project index (skill maintain-context): the entity of interest, the purpose when a source states it, and where to look next, including when the shape is not known yet.
- [**/context-boundary**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/boundary.md) — Project boundary (skill maintain-context): what is inside, what is outside, and the external entities, with what was not observed left unfilled.
- [**/context-slice**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/slice.md) — Context slice (skill maintain-context): one concern, such as how to run, conventions, modules, or gaps, where each fact cites its source.
- [**/context-map**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/map.md) — Context map (skill maintain-context): the projects in one workspace and the relation that was observed between them, without merging their models.
- [**/context-recommend**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/recommendation.md) — Plugin recommendation (skill maintain-context): which ADRenaline plugins match a signal that was read, left proposed.
- [**/context-refresh**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/references/refresh.md) — Context refresh (skill maintain-context): the next snapshot of a slice whose source changed, and a drift note when a judgment is stale.

## Skills

- [**maintain-context**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/skills/maintain-context/SKILL.md) — Records the current picture of a project. The first scan writes the index, the boundary, each slice that has a source, the map, and the recommendation when a signal was read. A later change publishes a new snapshot.

## Rules

- [**output-folder**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/rules/output-folder.mdc) — Every file goes in `adrenaline/project-context/` (or in `outputDirs["plugin-project-context"]` of `.cursor/adrenaline.json`). The artifact follows the language of the request.
- [**context-fidelity**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/rules/context-fidelity.mdc) — An accepted fact cites the file it was read from. What was not read stays "not observed". A recommendation starts proposed. The session hook only marks drift.

## Hooks

- [**sessionStart**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/hooks/cursor-hooks.json) — Cursor: compares the paths cited by accepted rows and, when one is newer, writes `drift:` in `STATUS.md` notes. It does not publish a snapshot and it does not change the state.
- [**SessionStart**](https://github.com/ADRenaline-Suite/plugin-project-context/blob/main/hooks/claude-hooks.json) — Claude Code: the same drift note, with its own hook file. The portable republish is `/context-refresh`.

## Output

- Repository: [**ADRenaline Project Context**](https://github.com/ADRenaline-Suite/plugin-project-context).
- Folder: `adrenaline/project-context/` (override via `.cursor/adrenaline.json`). An existing `project-context/` at the project root keeps receiving files.
- Name: `<NNN>-<type>-<topic>.<ext>`, with monotonic `<NNN>`. The prose follows the language of the request. The type stays the English piece id.

| Format | Description |
| --- | --- |
| `.md` | Index, boundary, slice, map, or recommendation. |
| `STATUS.md` | State of each file. Columns stay `N`, `archivo`, `estado`, `sustituye`, `notas`. |
| `ORIGIN.json` | Folder marker: `suite`, `plugin`, `repository`, `convention` `adr-001`. Not an `<NNN>` file. The index lists a folder only when this file was read |

## Not in this plugin

- Architecture description, ADR, and architecture evaluation → ADRenaline Software Architect (`plugin-software-architect`).
- UML diagram → [**ADRenaline UML Diagrams**](https://github.com/ADRenaline-Suite/plugin-uml-diagrams).
- Domain model → ADRenaline Backend (`plugin-backend`).
- Document for a reader → ADRenaline Documentation (`plugin-documentation`).
- Retrieval and tools for a model → ADRenaline GenAI (`plugin-genai`).
- Use case → ADRenaline Project Manager (`plugin-project-manager`).
- Screen specification → [**ADRenaline UI/UX Design**](https://github.com/ADRenaline-Suite/plugin-ui-ux-design).

In Claude Code, commands use the prefix `/plugin-project-context:` (example: `/plugin-project-context:context-help`).

## Done

- With no names after this command, the reply is this catalog. Every id is a markdown link to the GitHub URL listed here. Commands are grouped by skill.
- With names after this command, the reply is only the help for those names, in that order: the catalog line and, when the README has it, the paragraphs under that heading. The other names were not run.
- No skill ran. No command ran. No file was written.
- No entry was invented. If a component exists in the plugin and is missing here, one line was added from its `description` and the reply says the catalog was refreshed.
