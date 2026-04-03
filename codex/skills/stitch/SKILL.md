---
name: stitch
description: Use when the task involves Stitch project workflows for design-system-first UI generation, external design-source import, DESIGN.md synthesis, screen generation/editing, and iterative design refinement. Trigger for creating or applying project design systems before generating consistent Stitch screens.
---

# Stitch

Use this skill for Stitch-oriented UI generation and iteration tasks in a way that is grounded in current Stitch behavior, especially Stitch Beta 2.0 workflows around `DESIGN.md`, reusable design-system context, and project-based iteration.

This is the **base Stitch skill** in the local skill stack.
- It owns Stitch-specific behavior, tool usage, and project/design-system workflows.
- Other skills that use Stitch as a subsystem should defer to this skill for Stitch operations instead of redefining them.
- In particular, `stitch-loop` should handle baton orchestration, site integration, and iteration state, while this skill remains the source of truth for Stitch project and screen workflows.

Treat this skill as the practical counterpart to `openai-docs`:
- Use official Stitch docs and product posts as the source of truth when available.
- Prefer explicit Stitch tool workflows over vague prompting advice.
- Keep outputs bounded, consistent, and tied to the user's actual project state.

## Mandatory Execution Sequence

When this skill is used for project creation, external design import, or any prompt that should follow a project design system, the agent must execute the workflow in this order:

1. Resolve the target Stitch project.
2. Use Stitch MCP to instruct Stitch to synthesize the project's `DESIGN.md` design system first.
3. Take the full `DESIGN.md` content and use it as the system prompt/input for a second Stitch generation pass.
4. Instruct Stitch to render that `DESIGN.md` system onto the project canvas as the system/guideline board.
5. Treat that rendered output as the act of importing the design system into the project.
6. Treat the generated system as the project's theme and visual basis.
7. Only then generate or edit the requested UI screens in the same project.

The agent must not jump directly to page-level UI generation when the user's intent requires project-level design-system setup.

## Source Of Truth

Consult these sources first when the task is about how Stitch should be used:

1. `https://stitch.withgoogle.com/docs/design-md/overview`
2. `https://stitch.withgoogle.com/docs/design-md/format/`
3. `https://stitch.withgoogle.com/docs/design-md/usage/`
4. `https://blog.google/innovation-and-ai/models-and-research/google-labs/stitch-ai-ui-design/`

Use local Stitch skill references as implementation support when the official docs are incomplete or unavailable in the current environment:

- the companion `design-md` skill
- the companion `enhance-prompt` skill
- the bundled Stitch API reference for React/component workflows

## What Changed In Stitch Beta 2.0

Assume the following product realities unless the official docs contradict them:

- Stitch is no longer just a one-shot UI generator; it is an AI-native design canvas for creating, iterating, and collaborating on high-fidelity UI.
- `DESIGN.md` is a first-class, agent-friendly design-system artifact for moving design rules into and out of Stitch projects.
- Design-system context can be imported from outside sources, including extracting design rules from an external website URL.
- Stitch can generate project-level design guidance from imported or existing design systems, so project consistency should be treated as a core workflow, not an optional polish step.
- Project context matters. Prefer working from an existing Stitch project and its design system rather than prompting each screen in isolation.

## Stitch MCP Execution Contract

In this Codex environment, use the available Stitch MCP tools to drive the required project workflow even when there is no dedicated single-purpose import tool.

Required rule:

- Use Stitch MCP prompts to make Stitch itself generate the `DESIGN.md`-style design system inside the project.
- After the `DESIGN.md` content exists, send the full contents of that file back into Stitch as the system-generation prompt.
- In the same project flow, tell Stitch to render that `DESIGN.md` system onto the canvas as the project guideline/system board.
- Treat that rendered result as the design-system import step for the project.
- Treat that generated system as the project theme/design basis for downstream screens.
- Then continue with the user's requested UI generation in the same project.

Do not stop after producing a text-only summary outside Stitch if the user clearly wants the in-project Stitch workflow.

## Forbidden Shortcuts

When the goal is to establish a Stitch project design system, the agent must not:

- summarize or compress the generated `DESIGN.md` into a shorter prompt before sending it back into Stitch
- skip the step where the full `DESIGN.md` is sent back into Stitch as the system-generation input
- skip the step where Stitch renders the design-system guideline onto the project canvas
- generate feature screens before the design-system render/import step is complete
- treat an off-platform markdown file as equivalent to an in-project Stitch design-system import
- claim the project theme is established if Stitch has not yet been instructed to use the rendered system as the basis for downstream UI

## Required Behavior For Attached External Design Sources

When the user provides a website, screenshot, brand reference, or existing design system and asks for a design that should be applied to the current Stitch project, this skill must treat that as a **design-system bootstrapping request**, not as a plain screen-generation request.

Default required behavior:

1. Work inside the active or chosen Stitch project.
2. Instruct Stitch to analyze the attached source and synthesize the project's design system first.
3. Require a `DESIGN.md`-style system guideline to be generated in the project before feature screens are generated.
4. Take the generated `DESIGN.md` content and send it back into Stitch as the design-system generation prompt.
5. Instruct Stitch to render or place that `DESIGN.md`-driven design-system guideline onto the project canvas and use it as the project's ongoing theme basis.
6. Only after that, continue with downstream screen generation or editing using that synthesized system.

Do not skip directly to creating a feature screen if the user's real intent is to establish the project design system first.

## Use This Skill When

Activate this skill when the user wants to:

- Generate a new Stitch screen from a prompt
- Edit an existing Stitch screen
- Create visual variants of an existing screen
- Build or refine a multi-screen UI direction in Stitch
- Use or establish a `DESIGN.md` file for consistency
- Import or reuse design-system context from another source
- Export one or more Stitch screens into a destination Figma canvas
- Move from vague UI intent to a concrete Stitch generation workflow

## Do Not Use This Skill For

- Pure code implementation from Figma or another design source without Stitch in the loop
- Generic frontend styling requests where no Stitch project or Stitch-style workflow is involved
- Open-ended design critique that does not require generation or iteration in Stitch

## Available Stitch Tools In This Environment

Prefer the actual Stitch MCP tools exposed in this Codex environment:

- `mcp__stitch__list_projects`
- `mcp__stitch__create_project`
- `mcp__stitch__get_project`
- `mcp__stitch__list_screens`
- `mcp__stitch__get_screen`
- `mcp__stitch__generate_screen_from_text`
- `mcp__stitch__edit_screens`
- `mcp__stitch__generate_variants`

Do not instruct the agent to discover generic tool prefixes or call imaginary wrapper tools when the concrete tool names are already known.

For Figma handoff or export requests, combine this skill with the Figma skill stack and the available `mcp__figma__*` tools. The Stitch portion of the workflow is responsible for identifying the target project/screens and retrieving their hosted artifacts. The Figma portion is responsible for importing or recreating those artifacts inside the destination Figma file.

## Core Workflow

### 1. Clarify The Working Mode

Identify which of these the user actually needs:

- **New screen generation**: create a fresh screen from text
- **Targeted edit**: modify one or more existing screens
- **Variants exploration**: generate alternative directions from an existing screen
- **Design-system setup**: establish or refine `DESIGN.md` and project-level guidance before generation

If the user request is vague, make a reasonable assumption from the repo and prompt context instead of stalling.

### 2. Inspect Project Context First

Before generating anything substantial:

1. Check whether the user already has a Stitch project ID, project URL, or screen ID.
2. If not, use `mcp__stitch__list_projects` to find likely candidates.
3. If no suitable project exists, use `mcp__stitch__create_project`.
4. Use `mcp__stitch__get_project` and `mcp__stitch__list_screens` to understand the current project state before creating or editing screens.

Never assume a greenfield workflow if the user likely wants consistency with an existing project.

### 3. Establish Design-System Context

In Stitch Beta 2.0, `DESIGN.md` is part of the primary workflow, not a side artifact.

Use this precedence order:

1. **Existing project design guidance inside Stitch**
2. **A local `DESIGN.md` already present in the workspace**
3. **A design system synthesized from an existing Stitch screen or project**
4. **A design system imported or inferred from an external website/source**
5. **A temporary prompt-level design system block when nothing else exists**

If a local `DESIGN.md` exists:
- Read it and reuse its tokens, visual language, and component rules in generation prompts.

If no `DESIGN.md` exists but consistency matters:
- Prefer creating one from an existing Stitch project or screen.
- Reuse the `design-md` skill when a synthesized design-system document would materially improve output quality.

If the user explicitly wants to import style from another website or external source:
- Treat that source as upstream design-system input for Stitch Beta 2.0.
- Capture the imported rules in `DESIGN.md` or an equivalent project note so later generations reuse them consistently.

### 3.5 External Design System Import Workflow

If the user wants the Stitch Beta 2.0 pattern of:

- importing a design system from an external website
- producing a `DESIGN.md`
- applying it to the current Stitch project
- generating project guidelines/design-system previews on canvas

follow this workflow:

1. **Anchor to the active Stitch project**
   - Resolve or create the target project first.
   - Treat this project as the home for both the initial design output and the project design system.

2. **Prompt Stitch to synthesize the project design system first**
   - Explicitly instruct Stitch to derive a semantic project design system from that source.
   - Ask for the result to be reflected as a `DESIGN.md`-style system with sections such as:
     - North Star
     - Colors
     - Typography
     - Elevation
     - Components
     - Rules

3. **Capture the generated `DESIGN.md` content**
   - Treat the full `DESIGN.md` body as the reusable system prompt for the project.
   - Do not compress it into a short summary if the goal is project import.

4. **Send the full `DESIGN.md` back into Stitch**
   - Use the complete `DESIGN.md` content as the next Stitch prompt/input.
   - Instruct Stitch to generate the visual design-system guideline from that exact system prompt.

5. **Generate the design system into the Stitch project**
   - Tell Stitch to create the `DESIGN.md` design system as a project artifact.
   - Tell Stitch to render the design-system guideline onto the canvas so it is visible in the project workspace.
   - Treat that render step as the effective import of the design system into the project.

6. **Treat the synthesized `DESIGN.md` as the project source of truth**
   - Use the resulting system guideline as the canonical design instruction set for the project.
   - Do not generate feature screens until this system step has been completed or explicitly accepted by the user as sufficient.

7. **Prompt Stitch to apply that system to the project**
   - Instruct Stitch to use the synthesized system as the project's ongoing visual guideline for subsequent screens.
   - Treat the generated design-system canvas output as the project theme basis for later UI generation.

8. **Persist a workspace copy of `DESIGN.md` when possible**
   - If the user needs a local artifact, create or update a local `DESIGN.md` mirroring the system Stitch generated or was asked to generate.
   - This local file is the portable companion to the Stitch project system.

9. **Only then generate downstream UI**
   - Generate or edit real screens only after the system-establishing step.
   - Use the user's original product prompt as the downstream UI request.
   - Keep prompts consistent with the synthesized `DESIGN.md`.

Important:
- The required default is to ask Stitch itself to synthesize the system first, not merely to have the agent summarize the website offline.
- The `DESIGN.md` step comes before feature-screen generation when the task is about project-level styling.
- The skill should execute this as a chained project workflow: `prompt -> Stitch generates DESIGN.md/system -> full DESIGN.md is sent back into Stitch -> Stitch renders system on canvas -> Stitch uses it for downstream UI`.
- When possible, inspect the resulting Stitch outputs to confirm the project now contains both the system artifact and the generated UI.

### 4. Choose The Right Generation Path

#### A. New Screen

Use `mcp__stitch__generate_screen_from_text` when the user wants a new concept or page.

Prompt construction rules:
- Start with the page goal and user intent.
- Include platform/device assumptions.
- Include layout structure.
- Include explicit design-system guidance from `DESIGN.md` or project context.
- If the user attached an external design source and wants project-level consistency, first use this tool to ask Stitch to synthesize the project `DESIGN.md`, then send that full `DESIGN.md` back into Stitch to place the design-system guideline on canvas, apply it as the theme basis, and only then generate feature screens.
- Add only the level of detail needed for the next iteration.

#### B. Existing Screen Edit

Use `mcp__stitch__edit_screens` when the user wants to refine or change an existing screen without discarding its current direction.

Edit prompt rules:
- Make the requested changes explicit.
- State what must remain unchanged.
- Keep the scope tight when the user asks for a targeted adjustment.

#### C. Variants

Use `mcp__stitch__generate_variants` when the user wants exploration rather than a single deterministic revision.

Variant rules:
- Anchor variants to one or more real screens.
- Define what should vary: layout, tone, density, hierarchy, color emphasis, or component treatment.
- Keep the design system stable unless the user explicitly wants to explore different systems.

### 5. Retrieve And Inspect The Result

After generation or editing:

1. Use `mcp__stitch__get_screen` to inspect the generated screen object.
2. Review screen metadata such as dimensions, `deviceType`, and available assets.
3. If HTML or screenshots are returned via signed URLs, treat them as implementation artifacts and inspect them before claiming success.

Local reference: the bundled Stitch API notes describe `htmlCode.downloadUrl`, `screenshot.downloadUrl`, and related metadata returned by `get_screen`.

### 5.5 Export Selected Stitch Screens To Figma

Treat requests such as "export to Figma", "send to Figma", "place this Stitch screen in Figma", "copy to Figma", or "export to Figma clipboard" as a Stitch-to-Figma handoff workflow.

Runbook:

1. Resolve the exact Stitch project and screen IDs.
2. Call `mcp__stitch__get_screen`.
3. Use `htmlCode.downloadUrl` as the primary source when present. Keep `screenshot.downloadUrl` as fallback.
4. Choose destination mode:
   - `clipboard`: use `mcp__figma__generate_figma_design(outputMode: clipboard)`
   - `existingFile`: use `mcp__figma__generate_figma_design(outputMode: existingFile, fileKey: ...)`
5. If the user wants `existingFile` and did not provide a Figma URL/file target, ask for it. Do not guess.
6. Try HTML capture first.
7. If the Stitch HTML URL is a forced download or cannot be captured directly, switch immediately to the local fallback:
   - use `scripts/prepare_local_capture.sh`
   - open the returned `LOCAL_URL` with the `#figmacapture=...&figmaendpoint=...` hash
   - complete capture and poll when required
   - stop the temporary server with `scripts/stop_local_capture.sh`
8. If HTML capture fails, fall back to the hosted screenshot/image path and state that the result is visual-only.
9. Preserve Stitch screen names as frame/page labels when practical.
10. For `existingFile`, return a Figma screenshot for verification.
11. For `clipboard`, report completion and only mirror into a file when visual QA is needed.

Operational notes:

- Fastest tested file-mode path: `mcp__stitch__get_screen` -> `htmlCode.downloadUrl` -> `mcp__figma__generate_figma_design(outputMode: existingFile)` -> capture -> poll -> `mcp__figma__get_screenshot`
- Clipboard path: `mcp__stitch__get_screen` -> `htmlCode.downloadUrl` -> `mcp__figma__generate_figma_design(outputMode: clipboard)` -> capture
- Prefer `scripts/prepare_local_capture.sh` over ad hoc localhost setup
- Use `curl -L` only when a local HTML file is needed
- If multiple screens are requested, export them in a bounded batch with deterministic naming
- Do not claim success until Figma-side verification is complete for file exports

### 6. Close The Loop

Do not stop at raw generation if the user clearly needs a usable output.

Possible next actions:
- refine the prompt and regenerate
- edit the generated screen
- generate variants
- extract or update `DESIGN.md`
- hand off the generated screen to a code-oriented skill
- export the selected screen to a destination Figma canvas and return a verification screenshot

Prefer short iteration loops over trying to perfect the first prompt.

## Prompting Rules

When writing prompts for Stitch:

- Prefer structured prompts over loose prose
- Include product purpose, not just visual style
- Specify the screen type and major sections
- State desired emotional tone or brand character
- Reuse the design-system language consistently
- Mention constraints when they matter: dense vs airy, enterprise vs playful, mobile-first vs desktop-first

Good prompt shape:

```markdown
[One-sentence purpose of the screen]

DESIGN SYSTEM:
- [Theme, color roles, typography, shape language]
- [Component styling rules]
- [Layout principles]

SCREEN STRUCTURE:
1. [Section]
2. [Section]
3. [Section]

BEHAVIOR / CONSTRAINTS:
- [What must remain stable]
- [What should be emphasized]
```

For external design-system bootstrapping, prefer a prompt shape like:

```markdown
Analyze the attached website/reference and synthesize the design system for this Stitch project before generating any feature screens.

Your goal is to:
1. capture the source's visual identity and reusable interface patterns
2. establish the project's design system from that source
3. produce a `DESIGN.md`-style guideline for the project with:
   - North Star
   - Colors
   - Typography
   - Elevation
   - Components
   - Rules
4. generate that design system into the project as a `DESIGN.md` artifact
5. after generating the `DESIGN.md`, use the full contents of that file as the next system prompt
6. render the full design-system guideline onto the project canvas from that `DESIGN.md`
7. use that design system as the theme basis for future screens in this project

After the design system has been established, continue by generating the requested feature screens in the same project using that system.
```

For chained design-system-first execution, prefer a prompt shape like:

```markdown
Use this user request as the downstream UI goal: [insert the user's actual screen or product prompt].

Before creating the UI screens:
1. analyze the attached source/reference
2. generate the project's `DESIGN.md` design system
3. feed the full `DESIGN.md` back into Stitch as the system-generation prompt
4. render the complete design-system guideline onto the canvas
5. use that generated system as the theme and visual basis for the project

Then create the requested UI screens in this same project using the generated design system.
```

For Stitch-to-Figma export requests, prefer a prompt/instruction block like:

```markdown
## Stitch Instructions

Get the images and code for the following Stitch project's screens:

## Project
Title: [Project title]
ID: [Project ID]

## Screens:
1. [Screen name]
   ID: [Screen ID]

Use a utility like `curl -L` to download the hosted URLs.

Then export the selected screens into this destination Figma file/canvas:
[Figma URL or file/node target]

After import, capture a screenshot of the destination Figma canvas and return it for verification.
```

For fastest Stitch-to-Figma execution, prefer this operational sequence:

```markdown
1. Resolve the Stitch project and selected screen IDs.
2. Call `mcp__stitch__get_screen`.
3. If `htmlCode.downloadUrl` exists, use it as the primary export source.
4. Call `mcp__figma__generate_figma_design` with the correct output mode to get a capture ID when needed.
5. Try capture using the Stitch HTML source.
6. If the HTML URL triggers a file download instead of opening as a page, immediately:
   - `curl -L` the HTML locally
   - inject `capture.js`
   - serve it on localhost
   - open the localhost page with the figma capture hash
   - trigger capture and poll to completion
7. For file exports, call `mcp__figma__get_screenshot` on the returned node/file target and send that screenshot back to the user.
```

## Quality Rules

- Treat official Stitch docs as the primary source of truth.
- Treat `DESIGN.md` as the canonical reusable design-system artifact when available.
- Prefer project continuity over isolated one-off screens.
- Do not invent Stitch tool names, schema fields, or workflows without support from docs or local references.
- When an external design source is attached, default to generating the project's `DESIGN.md` first, then generating feature screens second.
- Default to asking Stitch to create the design-system artifact inside the project, then send the full `DESIGN.md` back into Stitch, render it on canvas, and use it as the theme basis before any page-level UI generation.
- When the user asks for export to Figma, require an explicit Figma destination and complete the Figma-side placement plus screenshot verification before considering the task done.
- When the user asks for Figma clipboard specifically, prefer `outputMode: clipboard` and do not force an existing-file destination.
- For export to Figma, prefer HTML capture into Figma over flat-image placement whenever `htmlCode.downloadUrl` exists.
- If Stitch HTML capture cannot be opened directly because the URL forces a download, use the local serve fallback immediately instead of retrying the external-path capture.
- Do not discard existing design language unless the user explicitly asks for a redesign.
- Keep prompts specific enough to produce stable output, but avoid over-constraining early ideation.
- When editing, preserve the unchanged parts of the current screen unless the prompt says otherwise.

## Fallback Rules

If official Stitch docs are inaccessible in the current environment:

1. Continue with the official URLs as the conceptual source of truth.
2. Use the local Stitch skill ecosystem as implementation guidance.
3. Call out clearly when a behavior is inferred from local references rather than read directly from the docs.

If there is no existing Stitch project:

1. Create one with `mcp__stitch__create_project`.
2. Give it a short title aligned with the user goal.
3. Treat the first generated screen as the seed for the project design system.

If there is no design system context:

1. Generate a minimal structured prompt-level design system.
2. After the first good screen, extract and persist that direction into `DESIGN.md`.

If the user asks to import/apply a design system into the active Stitch project:

1. Use Stitch MCP prompts to drive Stitch through the full sequence: synthesize `DESIGN.md` -> send full `DESIGN.md` back into Stitch -> render system on canvas -> use as project theme -> generate downstream UI.
2. Also create or refine a local `DESIGN.md` if the user needs a workspace artifact.
3. Use that synthesized system in all subsequent generation/edit prompts.
4. Inspect project/screen outputs after each major stage when possible.

If the user asks to export selected Stitch screens to Figma:

1. Resolve the selected Stitch screen IDs and retrieve their hosted artifacts with `mcp__stitch__get_screen`.
2. If the requested mode is `clipboard`, use `mcp__figma__generate_figma_design(outputMode: clipboard)`.
3. Otherwise, if no Figma destination link/reference was supplied, ask the user for the destination Figma URL before proceeding.
4. If `htmlCode.downloadUrl` exists, attempt HTML capture first.
5. If the HTML URL is a forced download or otherwise not directly capturable, use `scripts/prepare_local_capture.sh` and the local capture flow.
6. If HTML capture still fails, fall back to the hosted screenshot/image export path.
7. For existing-file mode, return a Figma screenshot after placement.
8. For clipboard mode, report completion and only mirror into a file when visual verification is needed.

## Recommended Companions

Use these adjacent skills when they materially improve the workflow:

- `design-md`: when the user needs a reusable `DESIGN.md` synthesized from Stitch assets
- `enhance-prompt`: when the raw idea is too vague for stable Stitch output
- `stitch-loop`: when the user wants repeated page-by-page autonomous website building, baton passing, sitemap-aware page sequencing, and static-site integration around Stitch output
- `react:components`: when the user wants to turn Stitch output into React components
- `figma` / `figma-generate-design` / `figma-use`: when the user wants Stitch outputs exported or recreated inside a Figma file

## Examples

### Example 0: Export A Selected Stitch Screen To Figma

User intent:

```text
Export the selected Stitch screen into my destination Figma file.
```

Expected skill behavior:

1. Resolve the Stitch project and screen IDs.
2. Use `mcp__stitch__get_screen` to fetch hosted screenshot/code URLs.
3. If the destination Figma link is missing, ask the user for it directly.
4. Prefer `htmlCode.downloadUrl` and capture it into the destination Figma file first.
5. If the HTML URL forces a download, switch immediately to `curl -L` + local serve + capture hash flow.
6. Fall back to screenshot placement only if HTML capture is unavailable.
7. Capture a screenshot of the Figma result and return it to the user.

### Example 0B: Export A Selected Stitch Screen To Figma Clipboard

User intent:

```text
Copy this Stitch screen to the Figma clipboard so I can paste it into Figma.
```

Expected skill behavior:

1. Resolve the Stitch project and screen IDs.
2. Use `mcp__stitch__get_screen` to fetch hosted screenshot/code URLs.
3. Prefer `htmlCode.downloadUrl`.
4. Use `mcp__figma__generate_figma_design(outputMode: clipboard)` to get a capture ID.
5. If the HTML URL forces a download, switch immediately to `curl -L` + local serve + capture hash flow.
6. Complete the clipboard capture flow and report clipboard completion.
7. If the user wants proof or QA, also run a bounded existing-file capture and return a screenshot.

Recommended instruction template:

```markdown
## Stitch Instructions

Get the images and code for the following Stitch project's screens:

## Project
Title: Wallet Top-up Flow
ID: 7852934960964054339

## Screens:
1. Transaction Success
   ID: 95d201981a054359a8d7742fc7182b50

Use a utility like `curl -L` to download the hosted URLs.

Then export the selected screens into this destination Figma file/canvas:
[Figma URL or file/node target]

After import, capture a screenshot of the destination Figma canvas and return it for verification.
```

### Example 1: Create Project Design System First From An External Website

User intent:

```text
Use https://example.com as the design reference for the current Stitch project.
Create the project's design system first, generate a DESIGN.md-style guideline,
and only after that prepare the project for future screen generation.
```

Expected skill behavior:

1. Resolve the active Stitch project or create one.
2. Use Stitch to analyze the external website as the upstream design source.
3. Ask Stitch to synthesize the project's design system first.
4. Ask for a `DESIGN.md`-style guideline covering:
   - North Star
   - Colors
   - Typography
   - Elevation
   - Components
   - Rules
5. Feed the full generated `DESIGN.md` back into Stitch as the system prompt.
6. Ask Stitch to generate the system guideline board on canvas.
7. Ask Stitch to use that generated system as the project theme basis.
8. Only after that, continue with downstream UI generation in the same project.

Recommended prompt shape:

```markdown
Analyze https://example.com and synthesize the design system for this Stitch project before generating any feature screens.

Create a reusable `DESIGN.md`-style guideline for the project with:
- North Star
- Colors
- Typography
- Elevation
- Components
- Rules

Generate this system into the project as a `DESIGN.md` artifact.
After that, use the full `DESIGN.md` contents as the next system prompt.
Render the full design-system guideline on the project canvas from that `DESIGN.md`.
Use this generated system as the theme basis for future screens in the project.
After that, continue with the user's requested UI generation in the same project.
```

### Example 2: Generate A New Screen Using An Existing DESIGN.md

User intent:

```text
Using the current project's DESIGN.md, create a desktop landing page for a crypto wallet product.
```

Expected skill behavior:

1. Inspect the target project and current screens.
2. Read the existing `DESIGN.md` or project system guidance first.
3. Use that system as the source of truth for the new screen prompt.
4. Generate the new screen with `mcp__stitch__generate_screen_from_text`.
5. Inspect the generated screen with `mcp__stitch__get_screen`.

Recommended prompt shape:

```markdown
Create a desktop landing page for a crypto wallet product using the project's existing design system.

DESIGN SYSTEM:
- Follow the established North Star, color roles, typography, elevation, components, and rules from the project `DESIGN.md`.

SCREEN STRUCTURE:
1. Hero with product value proposition
2. Trust indicators and wallet highlights
3. Feature grid
4. Security section
5. Final CTA

BEHAVIOR / CONSTRAINTS:
- Preserve the existing project style exactly
- Do not invent a new visual language
```

### Example 3: Generate Variants From The Existing Project Design System

User intent:

```text
Using the current DESIGN.md, create three dashboard variants with different layout density but the same brand system.
```

Expected skill behavior:

1. Read the current project design system first.
2. Identify the base screen or screens for exploration.
3. Use `mcp__stitch__generate_variants`.
4. Ask only for layout and hierarchy exploration while keeping the same design system stable.

Recommended prompt shape:

```markdown
Create three dashboard variants using the existing project design system.

Keep these fixed:
- North Star
- Color system
- Typography
- Elevation
- Component styling rules

Vary only:
- information density
- card grouping
- navigation emphasis
- section hierarchy

Do not change the brand system.
```

## References

- [DESIGN.md Overview](https://stitch.withgoogle.com/docs/design-md/overview)
- [DESIGN.md Format](https://stitch.withgoogle.com/docs/design-md/format/)
- [DESIGN.md Usage](https://stitch.withgoogle.com/docs/design-md/usage/)
- [Introducing “vibe design” with Stitch](https://blog.google/innovation-and-ai/models-and-research/google-labs/stitch-ai-ui-design/)
