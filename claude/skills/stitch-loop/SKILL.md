---
name: stitch-loop
description: Teaches agents to iteratively build websites using Stitch with an autonomous baton-passing loop pattern
---

# Stitch Build Loop

You are an **autonomous frontend builder** participating in an iterative site-building loop. Your goal is to generate a page using Stitch, integrate it into the site, and prepare instructions for the next iteration.

## Relationship To `stitch`

This skill is the **orchestration layer** for repeated website-building iterations.

- Use the base `stitch` skill as the source of truth for Stitch-specific behavior: project resolution, `DESIGN.md`-first workflows, screen generation, screen editing, variants, and Stitch MCP tool usage.
- Use this skill for baton handling, sitemap-aware sequencing, static-site integration, and end-of-iteration handoff.
- Do not duplicate or override the base Stitch workflow here unless the loop requires a site-integration-specific constraint.

## Mission

Build one production-usable page per iteration while preserving:
- structural integrity across the site
- visual consistency with `DESIGN.md`
- continuity of project state through `SITE.md`, `stitch.json`, and `next-prompt.md`

This skill is optimized for a **static HTML-first website workflow** where Stitch generates a page, the agent integrates it into the site, and the baton advances the roadmap.

## Overview

The Build Loop pattern enables continuous, autonomous website development through a "baton" system. Each iteration:
1. Reads the current task from a baton file (`next-prompt.md`)
2. Generates a page using Stitch MCP tools
3. Integrates the page into the site structure
4. Writes the next task to the baton file for the next iteration

## Prerequisites

**Required:**
- Access to the Stitch MCP Server
- A Stitch project (existing or will be created)
- A `DESIGN.md` file (generate one using the `design-md` skill if needed)
- A `SITE.md` file documenting the site vision and roadmap

**Optional:**
- Chrome DevTools MCP Server — enables visual verification of generated pages

## The Baton System

The `next-prompt.md` file acts as a relay baton between iterations:

```markdown
---
page: about
---
A page describing how jules.top tracking works.

**DESIGN SYSTEM (REQUIRED):**
[Copy from DESIGN.md Section 6]

**Page Structure:**
1. Header with navigation
2. Explanation of tracking methodology
3. Footer with links
```

**Critical rules:**
- The `page` field in YAML frontmatter determines the output filename
- The prompt content must include the design system block from `DESIGN.md`
- You MUST update this file before completing your work to continue the loop

## Core Constraints

- Do not recreate any page already marked as existing in `SITE.md`
- Do not let the generated page drift away from the visual language in `DESIGN.md`
- Do not leave placeholder internal navigation like `href="#"`
- Do not finish an iteration without updating both `SITE.md` and `next-prompt.md`
- Do not silently change the file layout described in this skill unless the repository already uses a different structure
- Treat `stitch.json` as persistent project state, not a temporary artifact

## Execution Protocol

### Step 1: Read the Baton

Parse `next-prompt.md` to extract:
- **Page name** from the `page` frontmatter field
- **Prompt content** from the markdown body

### Step 2: Consult Context Files

Before generating, read these files:

| File | Purpose |
|------|---------|
| `SITE.md` | Site vision, **Stitch Project ID**, existing pages (sitemap), roadmap |
| `DESIGN.md` | Required visual style for Stitch prompts |

**Important checks:**
- Section 4 (Sitemap) — Do NOT recreate pages that already exist
- Section 5 (Roadmap) — Pick tasks from here if backlog exists
- Section 6 (Creative Freedom) — Ideas for new pages if roadmap is empty

### Step 3: Generate with Stitch

Use the base `stitch` skill workflow for all Stitch-specific operations. In this loop, that means:

1. Resolve the working Stitch project.
2. Reuse the current project design-system context, including `DESIGN.md`.
3. Generate the requested page screen from the baton prompt.
4. Retrieve the resulting implementation artifacts and save them as:
   - `queue/{page}.html`
   - `queue/{page}.png`

Loop-specific rule:
- If `stitch.json` exists, prefer its `projectId` as the persisted project anchor for the loop.
- If it does not exist, create or resolve the project through the base `stitch` workflow and persist the chosen ID in `stitch.json`.
- Do not invent alternate Stitch tool names or alternate project bootstrapping rules inside this skill.

### Step 4: Integrate into Site

1. Move generated HTML from `queue/{page}.html` to `site/public/{page}.html`
2. Fix any asset paths to be relative to the public folder
3. Update navigation:
   - Find existing placeholder links (e.g., `href="#"`) and wire them to the new page
   - Add the new page to the global navigation if appropriate
4. Ensure consistent headers/footers across all pages

### Step 4.5: Visual Verification (Optional)

If the **Chrome DevTools MCP Server** is available, verify the generated page:

1. **Check availability**: confirm browser automation tools are present in the environment
2. **Start dev server**: Use Bash to start a local server (e.g., `npx serve site/public`)
3. **Navigate to page**: open `http://localhost:3000/{page}.html`
4. **Capture screenshot**: capture the rendered page
5. **Visual comparison**: Compare against the Stitch screenshot (`queue/{page}.png`) for fidelity
6. **Stop server**: Terminate the dev server process

> **Note:** This step is optional. If Chrome DevTools MCP is not installed, skip to Step 5.

### Step 5: Update Site Documentation

Modify `SITE.md`:
- Add the new page to Section 4 (Sitemap) with `[x]`
- Remove any idea you consumed from Section 6 (Creative Freedom)
- Update Section 5 (Roadmap) if you completed a backlog item

### Step 6: Prepare the Next Baton (Critical)

**You MUST update `next-prompt.md` before completing.** This keeps the loop alive.

1. **Decide the next page**:
   - Check `SITE.md` Section 5 (Roadmap) for pending items
   - If empty, pick from Section 6 (Creative Freedom)
   - Or invent something new that fits the site vision
2. **Write the baton** with proper YAML frontmatter:

```markdown
---
page: achievements
---
A competitive achievements page showing developer badges and milestones.

**DESIGN SYSTEM (REQUIRED):**
[Copy the entire design system block from DESIGN.md]

**Page Structure:**
1. Header with title and navigation
2. Badge grid showing unlocked/locked states
3. Progress bars for milestone tracking
```

## File Structure Reference

```
project/
├── next-prompt.md      # The baton — current task
├── stitch.json         # Stitch project ID (persist this!)
├── DESIGN.md           # Visual design system (from design-md skill)
├── SITE.md             # Site vision, sitemap, roadmap
├── queue/              # Staging area for Stitch output
│   ├── {page}.html
│   └── {page}.png
└── site/public/        # Production pages
    ├── index.html
    └── {page}.html
```

## Exit Criteria

Before completing an iteration, verify all of the following:

- The generated page exists at the final public path
- Asset references resolve correctly from the public page
- Global navigation links to the new page where appropriate
- No obvious placeholder links remain for related internal navigation
- `SITE.md` reflects the newly completed page and any consumed backlog item
- `next-prompt.md` contains a valid next task with YAML frontmatter
- The baton prompt includes the `DESIGN SYSTEM (REQUIRED)` block
- The next page does not already exist in the sitemap

If any of the above is false, the iteration is not complete.

## Orchestration Options

The loop can be driven by different orchestration layers:

| Method | How it works |
|--------|--------------|
| **CI/CD** | GitHub Actions triggers on `next-prompt.md` changes |
| **Human-in-loop** | Developer reviews each iteration before continuing |
| **Agent chains** | One agent dispatches to another (e.g., Jules API) |
| **Manual** | Developer runs the agent repeatedly with the same repo |

The skill is orchestration-agnostic — focus on the pattern, not the trigger mechanism.

## Design System Integration

This skill works best with the base `stitch` skill plus `design-md`:

1. **First time project setup**: use `stitch` to establish the project workflow and design-system context
2. **If a reusable local artifact is needed**: generate or refine `DESIGN.md` using the `design-md` skill from an existing Stitch screen
3. **Every iteration**: copy Section 6 ("Design System Notes for Stitch Generation") into your baton prompt
4. **Consistency**: all generated pages should inherit the same visual language through the shared Stitch project and `DESIGN.md`

## Common Pitfalls

- ❌ Forgetting to update `next-prompt.md` (breaks the loop)
- ❌ Recreating a page that already exists in the sitemap
- ❌ Not including the design system block in the prompt
- ❌ Leaving placeholder links (`href="#"`) instead of wiring real navigation
- ❌ Forgetting to persist `stitch.json` after creating a new project
- ❌ Assuming the generated Stitch HTML is ready to ship without integration cleanup
- ❌ Treating `SITE.md` as optional instead of the long-term memory for the loop

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Stitch generation fails | Check that the prompt includes the design system block |
| Inconsistent styles | Ensure DESIGN.md is up-to-date and copied correctly |
| Loop stalls | Verify `next-prompt.md` was updated with valid frontmatter |
| Navigation broken | Check all internal links use correct relative paths |
| Asset paths broken after move | Rewrite paths after moving from `queue/` to `site/public/` |
| Missing or stale project ID | Re-read `stitch.json` and `SITE.md`; if absent, create or record the project ID once |
| Page conflicts with existing site | Re-check `SITE.md` Section 4 before generating a new screen |
| Style drift across iterations | Refresh the baton using the latest design system block from `DESIGN.md` Section 6 |

## Scope Notes

This skill is best for:
- static marketing sites
- multi-page brochure sites
- HTML-first prototypes that need iterative growth

This skill is not, by itself, a full framework scaffolder for:
- React or Next.js application architecture
- componentized design-system implementation
- backend or CMS integration

If the repository uses a framework-first architecture, adapt the loop pattern but preserve the same baton, design-system, and sitemap discipline.

When the user mainly needs Stitch project operations without baton-based site iteration, use the base `stitch` skill instead.
