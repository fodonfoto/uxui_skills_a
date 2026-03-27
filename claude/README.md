# Claude Skill Pack

This folder contains Claude Code skill source files that are meant to be copied into a target Claude Code project and recreated there with `skill creator`.

## Single Entry Point

Use `skill creator` as the standardized entry point for creating or updating the other skills in this bundle.

## Included Skills

- `skill-creator`
- `prd-brief`
- `professor-ux`
- `stitch`
- `stitch-loop`
- `design-md`

## What This Bundle Is For

- turn raw requirements into PRD and BRIEF artifacts
- review UX/UI and design-to-code handoff quality
- support Stitch-oriented design workflows
- synthesize semantic `DESIGN.md` files from visual context
- provide a portable, skill-only bundle for Claude Code

## Install Into Claude Code

1. Open a Claude Code project.
2. Copy the files in `claude/skills/` into the target project's skill location.
3. Copy `claude/CLAUDE.md.example` into the target project as `CLAUDE.md` if you want the project-level usage note.
4. Run `skill creator` against one of the source files in this bundle.
5. Save the generated skill file in the target project.

## Notes

- This bundle intentionally contains skills only.
- It does not contain automations.
- It does not use the `agents` folder layout.
- If you need project-specific settings or permissions, add them in the target project's own configuration files.
