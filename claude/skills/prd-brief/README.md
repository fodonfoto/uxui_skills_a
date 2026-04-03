# PRD+BRIEF

Turn raw requirements into two stakeholder-ready Markdown artifacts:

- `PRD.md`
- `BRIEF.md`

## What It Does

Use this skill when the input is any of the following:

- meeting transcripts
- discovery notes
- raw requirement summaries
- loosely structured product context

It normalizes the source, extracts only supported facts, and produces:

- a detailed PRD with IDs, scope, risks, and acceptance criteria
- a concise brief for business, design, and engineering stakeholders

## Prerequisites

- A raw transcript, notes file, or requirement summary
- Enough source detail to identify problems, goals, users, and constraints
- Optional: a custom PRD or brief template if your team uses one

## Output

The skill is expected to produce:

- `PRD.md`
- `BRIEF.md`

When the user does not provide a target path, place the generated files next to the source material or in the current working folder.

## Quick Start

1. Provide the raw requirements or transcript.
2. Ask for `PRD.md` and `BRIEF.md`.
3. Review the output for `[AMBIGUOUS]`, `[TO CONFIRM]`, and `[DRAFT]` markers.
4. Use the PRD as the canonical source for backlog creation or implementation planning.

## Config Contract

If you publish this skill in a public repo, keep configuration explicit and portable:

- document any required source path
- document any custom template path
- avoid machine-specific absolute paths
- treat the source text as authoritative and do not invent missing scope

## References

- `SKILL.md` - main workflow and extraction rules
- `references/conversion-rules.md` - ID conventions and ambiguity handling
- `references/prd-template.md` - default PRD structure
- `references/brief-template.md` - default one-page brief structure
- `references/example-prompt.md` - ready-to-use generation prompt

