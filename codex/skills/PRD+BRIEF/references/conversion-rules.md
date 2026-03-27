# Conversion Rules

## Source of truth
- Use only the provided raw requirements, transcript, or summary.
- Do not add unrequested features, constraints, or business goals.

## ID conventions
- `PRD-ID`: `PRD--001`
- `UC`: `UC-001`, `UC-002`, ...
- `FR`: `FR--001`, `FR--002`, ...
- `FLOW`: `FLOW--001`, `FLOW--002`, ...
- `AC`: `AC--001`, `AC--002`, ...
- `BR`: `BR--001`, `BR--002`, ...

## Ambiguity handling
- Use `[AMBIGUOUS]` for unclear source statements.
- Use `[TO CONFIRM]` for missing decisions or unverifiable details.
- Use `[DRAFT]` for derived acceptance criteria or assumptions that are not explicit in the input.

## Inclusion rules
- Keep:
  - stated problems
  - explicit goals
  - named users / roles
  - quoted requirements
  - constraints, risks, dependencies, edge cases, out-of-scope items
- Exclude:
  - speculative implementation detail
  - hidden product assumptions
  - feature creep

## PRD focus
- Detailed and structured.
- Capture traceability between problems, use cases, FRs, and ACs.
- Prefer explicit references over paraphrase when the source already uses stable terminology.

## BRIEF focus
- One-page summary.
- Business/design/engineering readable.
- Compress detail into outcomes, scope, and next steps.

