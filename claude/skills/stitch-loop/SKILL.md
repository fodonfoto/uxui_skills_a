---
name: stitch-loop
description: Run an iterative Stitch build loop that grows a site one page at a time while preserving SITE.md and DESIGN.md continuity.
---

# Stitch Build Loop

Use this skill for repeated website-building iterations.

## Purpose

Drive a page-by-page build loop that keeps site memory, design memory, and generated output aligned across iterations.

## Core Responsibilities

- read the current baton / next prompt
- build one page per iteration
- integrate the generated output into the site
- update `SITE.md` and the next baton
- preserve design consistency with `DESIGN.md`

## Inputs

- current baton or next prompt
- existing site memory
- design memory
- any staged generation output

## Outputs

- one completed iteration
- updated `SITE.md`
- updated baton or next prompt
- staged output integrated into the target site structure

## Rules

- Do not recreate pages already tracked in `SITE.md`.
- Do not complete an iteration until the site memory and next prompt are both updated.
- Keep generated HTML as staging output until it is integrated into the public site folder.
- Use the companion `stitch` skill for Stitch-specific generation and the companion `design-md` skill for design-system synthesis.
- If the current iteration depends on missing context, stop and surface the missing input before generating.

## Failure Behavior

- If a page already exists in the site memory, update the next step instead of duplicating it.
- If the design memory conflicts with the next prompt, preserve the stronger source of truth and report the conflict.
- If the generated output cannot be integrated cleanly, leave staging output untouched and explain why.
