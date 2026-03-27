---
name: stitch
description: Work with Stitch project generation, screen analysis, and Stitch-oriented design workflows.
---

# Stitch

Use this skill for Stitch-specific workflows.

## Expected Responsibilities

- analyze Stitch project context
- generate or refine screen prompts
- keep prompts aligned with the project design system
- use the companion `design-md` skill when a semantic `DESIGN.md` file is needed

## Rules

- Keep Stitch project context consistent.
- Prefer design-system-aware prompts over ad hoc visual descriptions.
- Do not invent project IDs, screen IDs, or design tokens.
- If the task needs a design system summary, delegate to `design-md`.

This skill is meant to be paired with a Claude Code project that already has Stitch access or a Stitch-connected workflow.

