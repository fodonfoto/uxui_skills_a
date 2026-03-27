---
name: stitch
description: Work with Stitch project generation, screen analysis, and Stitch-oriented design workflows.
---

# Stitch

Use this skill for Stitch-specific workflows.

## Purpose

Help Claude produce Stitch prompts and Stitch-oriented design decisions that stay aligned with the project context.

## Expected Responsibilities

- analyze Stitch project context
- generate or refine screen prompts
- keep prompts aligned with the project design system
- use the companion `design-md` skill when a semantic `DESIGN.md` file is needed

## Inputs

- Stitch project context
- design requirements
- page descriptions
- related `DESIGN.md` or site-memory files

## Outputs

- Stitch-ready prompts
- clarified design direction
- context-aware generation guidance
- references to companion design synthesis when needed

## Rules

- Keep Stitch project context consistent.
- Prefer design-system-aware prompts over ad hoc visual descriptions.
- Do not invent project IDs, screen IDs, or design tokens.
- If the task needs a design system summary, delegate to `design-md`.
- If the context is incomplete, state the missing dependency instead of guessing.

This skill is meant to be paired with a Claude Code project that already has Stitch access or a Stitch-connected workflow.
