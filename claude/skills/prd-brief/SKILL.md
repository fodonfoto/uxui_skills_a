---
name: prd-brief
description: Turn raw requirements, discovery notes, or transcripts into PRD.md and BRIEF.md with careful ambiguity handling.
---

# PRD + BRIEF

Use this skill when raw product input needs to become two stakeholder-ready Markdown artifacts:

- `PRD.md`
- `BRIEF.md`

## Purpose

Convert noisy product input into a clean requirement summary and then into two publishable documents:

- a detailed PRD that can drive implementation
- a concise brief that stakeholders can review quickly

## What It Does

This skill normalizes the source, extracts only supported facts, and produces:

- a detailed PRD with IDs, scope, risks, and acceptance criteria
- a concise brief for business, design, and engineering stakeholders

## Input

- meeting transcripts
- discovery notes
- messy requirement dumps
- user-provided raw summaries

## Output

- `PRD.md`
- `BRIEF.md`
- a short list of the highest-risk ambiguities

## Rules

- Use only the source material provided by the user.
- Do not invent scope, goals, or behavior.
- Mark unclear items with `[AMBIGUOUS]`, `[TO CONFIRM]`, or `[DRAFT]`.
- Keep the PRD detailed and the brief concise.
- Keep IDs stable and consistent across the two documents.

## Preferred Workflow

1. Normalize the input into a clean requirement summary.
2. Classify facts into problems, goals, users, use cases, FRs, NFRs, constraints, risks, and open questions.
3. Draft the PRD from the detailed template.
4. Draft the BRIEF from the concise stakeholder template.
5. Return both files with a short summary of the key ambiguities.

## Failure Behavior

- If the source is too thin to support a PRD, mark the missing areas explicitly instead of filling gaps.
- If the input mixes requirements with unrelated discussion, isolate the product-relevant material first.
- If a field is ambiguous, keep it in the open questions section instead of guessing.
