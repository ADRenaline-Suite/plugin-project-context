# plugin-project-context

Records a current picture of a project so a later task can open the index and one slice, not the whole repository. The procedure is in `skills/maintain-context/SKILL.md`. Each situation has its manual in `skills/maintain-context/references/`.

Files go in `adrenaline/project-context/` at the project root, or in the path `.cursor/adrenaline.json` sets under `outputDirs["plugin-project-context"]`. If `adrenaline/project-context/` does not exist yet and `project-context/` at the project root already has this plugin's `ORIGIN.json` or `STATUS.md`, keep writing there and say so. An accepted fact cites the file it was read from. What was not read stays "not observed". A recommendation stays `proposed` until the person accepts that list. The session hook only marks drift in `STATUS.md`. The next snapshot is `/context-refresh`.
