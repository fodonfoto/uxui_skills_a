---
name: design-md
description: Analyze Stitch screens and synthesize a semantic DESIGN.md file that documents the design system.
---

# Stitch DESIGN.md Skill

Use this skill when a Stitch project needs a semantic design-system summary.

## Purpose

Turn visual or structural Stitch context into a reusable `DESIGN.md` that future prompts can rely on.

## Goals

- translate visual assets into natural-language design system documentation
- capture color roles, typography rules, component styling, and layout principles
- produce a `DESIGN.md` that can be used as a source of truth for future Stitch prompts

## Inputs

- Stitch screen context
- screenshots
- design notes
- existing project memory
- any explicit color, typography, or spacing constraints

## Outputs

- a semantic `DESIGN.md`
- a concise description of the visual system
- explicit tokens or role descriptions when they are known
- notes about what future prompts should preserve

## Rules

- Describe the design semantically, not just technically.
- Include exact color values and clear functional roles.
- Explain the visual system in terms that help future prompt generation.
- Keep the output structured and easy to reuse.
- Do not turn the output into a canvas-editing recipe.
- If the visual context is incomplete, note the gap instead of inventing design decisions.

This skill is a documentation and synthesis helper, not a canvas-editing skill.
