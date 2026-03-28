# Design System Documentation Skill

## Install

```bash
npx skills add google-labs-code/stitch-skills --skill design-md --global
```

## Example Prompt

```text
Generate a DESIGN.md file from my PRD or brief, and use any available visual references to refine the design language.
```

## Skill Structure

This repository follows the **Agent Skills** open standard. Each skill is self-contained with its own logic, workflow, and reference materials.

```text
design-md/
├── SKILL.md           — Core instructions & workflow
├── examples/          — Sample DESIGN.md outputs
└── README.md          — This file
```

## How it Works

When activated, the agent follows a structured design analysis pipeline:

1. **Source reading**: Starts with the PRD, brief, or other requirement documents.
2. **Retrieval**: Uses Stitch MCP Server assets when available to fetch project screens, HTML code, and design metadata.
3. **Extraction**: Identifies design tokens including colors, typography, spacing, and component patterns.
4. **Translation**: Converts technical CSS/Tailwind values or narrative requirements into descriptive, natural design language.
5. **Synthesis**: Generates a comprehensive DESIGN.md following the semantic design system format.
6. **Alignment**: Keeps the output grounded in product intent and, when relevant, Stitch prompting guidance.

## Config Contract

If you publish or fork this skill, keep these settings explicit:

- PRD, brief, or supporting source documents
- optional Stitch project ID or lookup method when visual assets exist
- target screen, project scope, or feature scope
- whether the output should be written to an existing `DESIGN.md` or generated from scratch
- the source asset used for analysis
- any repo-specific folder path for the generated file

## Public Repo Notes

This skill is portable as long as source references are resolved at runtime and not hardcoded to one machine.
