# Changelog

## [0.0.1] - 2026-10-30

### Added

- The output folder keeps `ORIGIN.json` (`suite`, `plugin`, `repository`, `convention` `adr-001`). It is not an `<NNN>` file and it has no row in `STATUS.md`.
- The index records a folder as suite output when that `ORIGIN.json` was read. A folder name alone is not that fact. A refresh publishes the next index when that set changes. The purpose stays as it was.
- Index, boundary, slice, map, and recommendation for one project, for several projects in one workspace, or for a project whose shape is not known yet. Each accepted fact cites its source. A recommendation stays `proposed`.
- The README opens with the first scan. The session hook does not run it. The README shows two paths: `/context-start` for the first picture, and the hook drift note plus `/context-refresh` for a later change. The UML 2.5.1 activity is drawn in the workspace, not inside this plugin.
- `/context-refresh` publishes the next snapshot when a slice source changed, and marks drift when a judgment is stale. A Cursor `sessionStart` hook and a Claude Code `SessionStart` hook write that drift note and do not publish a snapshot.

### Changed

- A new output folder is `adrenaline/project-context/`. An existing `project-context/` at the project root keeps receiving files. `outputDirs` still wins. The index also reads `ORIGIN.json` in each direct child of `adrenaline/`.
- `/context-start` writes the first picture: the index, the boundary, each slice that has a source, the map, and the recommendation when a signal was read. A slice with no source and a recommendation with no signal are not files. It does not refresh.
- `/context-start` writes one pointer sentence into `AGENTS.md` at the project root. It does not rewrite the rest of that file and it does not write a rule file.
