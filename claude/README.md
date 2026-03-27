# Claude Skill Pack

This bundle mirrors the Codex skill workflows in a Claude Code-friendly skill format.

## What You Get

- `skill-creator` for generating or updating skills from repository source files
- `prd-brief` for turning raw requirements into `PRD.md` and `BRIEF.md`
- `professor-ux` for UX/UI review, audit, and TCEBC prompt synthesis
- `stitch` for Stitch project workflows and `DESIGN.md`-first generation
- `stitch-loop` for iterative page-by-page baton loops
- `design-md` for synthesizing semantic `DESIGN.md` files from Stitch assets

## Single Entry Point

Use `skill creator` as the standardized entry point for creating or updating the other skills in this bundle.

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
