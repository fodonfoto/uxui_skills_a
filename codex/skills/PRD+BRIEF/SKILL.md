---
name: PRD+BRIEF
description: Turn raw requirements into a detailed PRD.md and a concise BRIEF.md; use when discovery notes, transcripts, or requirement summaries need to become stakeholder-ready product docs.
metadata:
  short-description: Convert raw requirements into PRD and brief docs
---

# Requirements Docs

Use this skill when the input is raw requirements, discovery notes, meeting transcripts, or an existing raw summary and the output must be two Markdown files:
- `PRD.md`
- `BRIEF.md`

## Quick start
1. Read the raw requirements and extract only what is supported by the source.
2. Identify ambiguities, missing decisions, and out-of-scope items.
3. Draft `PRD.md` using the detailed product template in `references/prd-template.md`.
4. Draft `BRIEF.md` using the concise stakeholder template in `references/brief-template.md`.
5. Keep both docs aligned on scope, goals, users, and constraints.

## Workflow

### 1) Normalize the input
- Treat the source as authoritative.
- If the source is a transcript, convert it into a clean requirement summary first.
- If the source is already a raw summary, use it directly.
- Do not invent product behavior, business goals, or scope.

### 2) Classify the content
- Separate facts into:
  - Problem / pain points
  - Goals / outcomes
  - Users / personas
  - Use cases
  - Functional requirements
  - Non-functional requirements
  - Business rules
  - Constraints / dependencies / risks
  - Edge cases / open questions

### 3) Write `PRD.md`
- Use the bundled PRD structure in `references/prd-template.md`.
- Preserve the section order from the template unless the user provides a stricter template.
- Assign IDs consistently:
  - `PRD-ID: PRD--001`
  - `UC-IDs: UC-001, UC-002, ...`
  - `FR-IDs: FR--001, FR--002, ...`
  - `FLOW-IDs: FLOW--001, FLOW--002, ...`
  - `AC-IDs: AC--001, AC--002, ...`
  - `BR-IDs: BR--001, BR--002, ...`
- For each FR:
  - Describe WHAT the system must do, not HOW.
  - Link relevant use cases and problem statements by section reference or short labels from the source.
  - Add draft acceptance criteria when the source supports them.
- Put anything unclear into `Open Questions`.

### 4) Write `BRIEF.md`
- Use the bundled brief structure in `references/brief-template.md`.
- Keep it concise and stakeholder-friendly.
- Summarize only the highest-value items:
  - project summary
  - problem / why now
  - target users
  - goals / success
  - core use cases
  - design focus
  - solution overview
  - scope
  - constraints / risks
  - next steps

### 5) Handle uncertainty
- Use `[AMBIGUOUS]` or `[TO CONFIRM]` for unclear statements.
- Use `[DRAFT]` for assumptions or acceptance criteria that are not explicit in the source.
- Never silently fill gaps with invented detail.

## Output rules
- If the user asks for files, create `PRD.md` and `BRIEF.md`.
- If no path is given, place the files alongside the source material or in the current working folder.
- Keep naming consistent and stable.
- If a custom template is provided by the user, follow it exactly and use this skill only for extraction, normalization, and quality control.

## References
- `references/conversion-rules.md` - extraction rules, ambiguity handling, and ID conventions
- `references/prd-template.md` - default PRD structure
- `references/brief-template.md` - default one-page brief structure
- `references/example-prompt.md` - ready-to-use prompt for generating both files from raw requirements
