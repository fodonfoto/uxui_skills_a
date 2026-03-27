# Stitch Build Loop Skill

Teaches agents to iteratively build websites using Stitch with an autonomous baton-passing loop pattern.

## Install

```bash
npx skills add google-labs-code/stitch-skills --skill stitch-loop --global
```

## What It Does

Enables continuous, autonomous website development through a "baton" system:

1. Agent reads task from `next-prompt.md`
2. Generates page via Stitch MCP tools
3. Integrates into site structure
4. Writes next task to continue the loop

The core unit of work is **one page per iteration**, not a one-shot full-site generation. Over repeated runs, the site grows while preserving design consistency and project memory.

This skill is the orchestration companion to the base `stitch` skill:
- `stitch` handles Stitch-native project, design-system, and screen workflows
- `stitch-loop` handles repeated page sequencing, `SITE.md`, `next-prompt.md`, and static-site integration

## Prerequisites

- Stitch MCP Server access
- A `DESIGN.md` file (generate with the `design-md` skill)
- A `SITE.md` file for project context
- A repository structure where generated HTML can be staged and then merged into a public site folder

## Quickstart

1. Create or open a repo for the site.
2. Add `SITE.md` using the template in [`resources/site-template.md`](./resources/site-template.md).
3. Add `DESIGN.md` using `design-md` or write it manually with a reusable Section 6 design-system block.
4. Create `next-prompt.md` using the format in [`resources/baton-schema.md`](./resources/baton-schema.md).
5. Run the agent with a prompt such as:

```text
Read my next-prompt.md, build that page with Stitch, integrate it into the site, update SITE.md, and then write the next baton.
```

6. Review the integrated page, then repeat the same invocation for the next iteration.

## Example Prompt

```text
Read my next-prompt.md and generate the page using Stitch, then prepare the next iteration.
```

## Expected Working Files

The loop assumes these files exist or will be created:

- `next-prompt.md`: the baton for the current iteration
- `SITE.md`: project memory including sitemap and roadmap
- `DESIGN.md`: visual source of truth
- `stitch.json`: persisted Stitch project metadata
- `queue/`: staging area for raw Stitch output
- `site/public/`: final integrated pages

## Recommended Iteration Pattern

For each run, the agent should:

1. Read `next-prompt.md`, `SITE.md`, and `DESIGN.md`
2. Generate the requested page in the existing Stitch project
3. Save raw output to `queue/`
4. Move and clean the HTML into `site/public/`
5. Update navigation and related site chrome
6. Mark the page complete in `SITE.md`
7. Write the next baton to `next-prompt.md`

An iteration is incomplete if the new page exists only in Stitch or only in `queue/`.

## Skill Structure

```
stitch-loop/
├── SKILL.md              — Core pattern instructions
├── README.md             — This file
├── resources/
│   ├── baton-schema.md   — Baton file format spec
│   └── site-template.md  — SITE.md/DESIGN.md templates
└── examples/
    ├── next-prompt.md    — Example baton
    └── SITE.md           — Example site constitution
```

## Works With

- **`stitch` skill**: Base Stitch project and screen workflow; use this as the source of truth for Stitch operations
- **`design-md` skill**: Generate `DESIGN.md` from existing Stitch screens
- **CI/CD**: GitHub Actions can trigger new iterations on push
- **Agent chains**: Dispatch to other agents (Jules, etc.)

## Best Fit

Use this skill when you want:

- a repeatable workflow for growing a static multi-page website
- consistent design prompts across many pages
- explicit handoff state between autonomous or human-reviewed iterations

Use a different skill or an adapted workflow when you primarily need:

- React or Next.js component generation
- framework routing and application state
- direct conversion into a production app architecture

## Operational Notes

- `SITE.md` is not just documentation; it is the site's planning memory.
- `DESIGN.md` is not just reference material; its Stitch generation block should be copied into every baton.
- `next-prompt.md` must always be rewritten before the iteration ends, or the loop stops.
- Generated HTML should be treated as intermediate output until asset paths and navigation are verified.

## Learn More

See [SKILL.md](./SKILL.md) for complete instructions.
