# Memory Template

Use this file as a running memory for the automation when publishing a public template.

## Run Notes

- Run time: [TEMPLATE]
- Handled source: `<project-root>/<source-file>.md`

## Conversion Result

- `<project-root>/<source-folder>/PRD.md`
- `<project-root>/<source-folder>/BRIEF.md`
- `<project-root>/<source-folder>/DESIGN.md`

## Skipped Files

- [TBD]

## Ambiguities

- [TBD]

## Notes

- Existing `PRD.md`, `BRIEF.md`, and `DESIGN.md` are not overwritten unless explicitly requested.
- Output folder: `<project-root>/<source-folder>/`
- `DESIGN.md` must be synthesized from the generated `PRD.md` and `BRIEF.md` using the `design-md` skill.
- If backlog creation is enabled, record only the chosen destination system and the URLs or IDs it returns.
