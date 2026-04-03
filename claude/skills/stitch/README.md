# Stitch

## What this skill is
- Base skill for Stitch project workflows, design-system-first generation, and screen iteration.

## What is included
- `SKILL.md`
- `agents/openai.yaml`
- `scripts/prepare_local_capture.sh`
- `scripts/stop_local_capture.sh`

## How to use
1. Use this skill when you need Stitch project generation or iteration.
2. Resolve the target Stitch project first.
3. Establish or reuse a `DESIGN.md` system before generating screens.

## What it does
- Creates or updates Stitch project design systems
- Generates screens and variants
- Supports project-level continuity through design-system context
- Prepares Stitch HTML exports for local Figma capture flows

## What to configure
- Stitch project
- Design-system context, usually via `DESIGN.md`
- Any companion skills needed for prompt refinement or design-system synthesis

## Notes
- Keep the design system stable across screens.
- Prefer project continuity over one-off prompts.
- For design-system-first workflows, establish the project theme before page-level generation.
