# Changelog

## [0.0.1] - 2026-10-30

### Added

- Index, boundary, slice, map, and recommendation for one project, for several projects in one workspace, or for a project whose shape is not known yet. Each accepted fact cites its source. A recommendation stays `proposed`.
- `/context-start` writes the index and the boundary in one step. The README opens with that first scan. The session hook does not run it.
- The README shows the order of the commands. The UML 2.5.1 activity is drawn in the workspace, not inside this plugin.
- `/context-refresh` publishes the next snapshot when a slice source changed, and marks drift when a judgment is stale. A Cursor `sessionStart` hook and a Claude Code `SessionStart` hook write that drift note and do not publish a snapshot.
