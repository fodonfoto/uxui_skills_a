---
name: design-md
description: Synthesize a semantic design system into DESIGN.md files from PRDs, briefs, or Stitch project assets
allowed-tools:
  - "stitch*:*"
  - "Read"
  - "Write"
  - "web_fetch"
---

# DESIGN.md Skill

You are an expert Design Systems Lead. Your goal is to analyze the provided source material and synthesize a "Semantic Design System" into a file named `DESIGN.md`.

## Overview

This skill helps you create `DESIGN.md` files that serve as the "source of truth" for prompting design tools to generate new screens that align with an existing design language. When Stitch assets are available, they can be used to calibrate the system through visual descriptions and specific color values. When they are not available, the file should still be generated from PRDs, briefs, product notes, or other requirement documents.

## Prerequisites

- A PRD, brief, or other product requirement source is sufficient
- If available, Stitch project assets can be used as supporting reference material
- Access to the Stitch Effective Prompting Guide: https://stitch.withgoogle.com/docs/learn/prompting/

## The Goal

The `DESIGN.md` file will serve as the "source of truth" for prompting generation tools to create new screens that align with the desired design language. Stitch assets, when present, help ground the system in visual evidence; otherwise, the file should be inferred from product intent, UX requirements, and narrative direction in the PRD or brief.

## Source Strategy

Use the strongest available source first:

1. **PRD / Brief**: Primary source for product intent, audience, tone, constraints, and hierarchy
2. **Supporting references**: Existing docs, brand notes, copy guidelines, or screenshots
3. **Stitch assets**: Use when available to validate and refine the visual system

Do not block generation on the absence of Stitch data. If a PRD or brief is available, synthesize the design language from that material and use any visual references only to sharpen the output.

## Retrieval and Networking

To analyze a Stitch project when one is available, retrieve screen metadata and design assets using the Stitch MCP Server tools. If you are working only from a PRD or brief, skip this section and derive the system directly from the provided source material.

1. **Namespace discovery**: Run `list_tools` to find the Stitch MCP prefix. Use this prefix (e.g., `mcp_stitch:`) for all subsequent calls.

2. **Project lookup** (if Project ID is not provided):
   - Call `[prefix]:list_projects` with `filter: "view=owned"` to retrieve all user projects
   - Identify the target project by title or URL pattern
   - Extract the Project ID from the `name` field (e.g., `projects/13534454087919359824`)

3. **Screen lookup** (if Screen ID is not provided):
   - Call `[prefix]:list_screens` with the `projectId` (just the numeric ID, not the full path)
   - Review screen titles to identify the target screen (e.g., "Home", "Landing Page")
   - Extract the Screen ID from the screen's `name` field

4. **Metadata fetch**:
   - Call `[prefix]:get_screen` with both `projectId` and `screenId` (both as numeric IDs only)
   - This returns the complete screen object including:
     - `screenshot.downloadUrl` - Visual reference of the design
     - `htmlCode.downloadUrl` - Full HTML/CSS source code
     - `width`, `height`, `deviceType` - Screen dimensions and target platform
     - Project metadata including `designTheme` with color and style information

5. **Asset download**:
   - Use `web_fetch` or `read_url_content` to download the HTML code from `htmlCode.downloadUrl`
   - Optionally download the screenshot from `screenshot.downloadUrl` for visual reference
   - Parse the HTML to extract Tailwind classes, custom CSS, and component patterns

6. **Project metadata extraction**:
   - Call `[prefix]:get_project` with the project `name` (full path: `projects/{id}`) to get:
     - `designTheme` object with color mode, fonts, roundness, custom colors
     - Project-level design guidelines and descriptions
     - Device type preferences and layout principles

## Analysis & Synthesis Instructions

### 1. Extract Project Identity
- If working from Stitch, locate the Project Title and specific Project ID
- If working from a PRD or brief, locate the product name, initiative name, or feature title
- Preserve the project identity exactly as it appears in the source material unless a normalized label is clearly needed

### 2. Define the Atmosphere
Evaluate the strongest available evidence, in this order:
- PRD / brief language and positioning
- Brand notes, copy tone, and user experience goals
- Screenshots, HTML, or other visual references when available

Use evocative adjectives to describe the mood (e.g., "Airy," "Dense," "Minimalist," "Utilitarian").

### 3. Map the Color Palette (Tailwind Config/JSON)
Identify the key colors in the system from whichever source is available. For each color, provide:
- A descriptive, natural language name that conveys its character (e.g., "Deep Muted Teal-Navy")
- The specific hex code in parentheses for precision (e.g., "#294056")
- Its specific functional role (e.g., "Used for primary actions")

### 4. Translate Geometry & Shape (CSS/Tailwind)
Convert technical `border-radius` and layout values into physical descriptions:
- Describe `rounded-full` as "Pill-shaped"
- Describe `rounded-lg` as "Subtly rounded corners"
- Describe `rounded-none` as "Sharp, squared-off edges"

### 5. Describe Depth & Elevation
Explain how the UI handles layers. Describe the presence and quality of shadows (e.g., "Flat," "Whisper-soft diffused shadows," or "Heavy, high-contrast drop shadows").

### 6. Infer Missing Details Carefully
- If a source does not specify a detail, infer the most likely design choice from the surrounding context
- Mark assumptions through phrasing rather than technical certainty when needed
- Do not invent brand rules that conflict with the source material

## Output Guidelines

- **Language:** Use descriptive design terminology and natural language exclusively
- **Format:** Generate a clean Markdown file following the structure below
- **Precision:** Include exact hex codes for colors while using descriptive names
- **Context:** Explain the "why" behind design decisions, not just the "what"
- **Source Flexibility:** Use PRD or brief language as the primary basis when Stitch assets are not available

## Template Precedence

Use the example at `examples/DESIGN.md` as the default template for generated output.

Template priority:
1. If the user provides a project-specific `DESIGN.md` template, follow it exactly.
2. If the user provides a custom example like the one in the conversation, mirror its section order, tone, and structure.
3. If no custom template is provided, use `examples/DESIGN.md` as the baseline.
4. If neither Stitch nor a user-provided example is available, synthesize a practical `DESIGN.md` directly from the PRD or brief using the default shape.

When a template is provided, keep the content concise, semantically descriptive, and grounded in the strongest available source material. Do not replace the template with a generic design-system narrative unless the user explicitly asks for that.

## Default `DESIGN.md` Output Shape

Unless the user provides a stricter template, generate `DESIGN.md` using this exact structure:

```markdown
# Design System

## Overview
A calm, professional interface for a healthcare scheduling platform.
Accessibility-first design with high contrast and generous touch targets.

## Colors
- **Primary** (#2665fd): CTAs, active states, key interactive elements
- **Secondary** (#6074b9): Supporting actions, chips, toggle states
- **Tertiary** (#bd3800): Accent highlights, badges, decorative elements
- **Neutral** (#757681): Backgrounds, surfaces, non-chromatic UI

## Typography
- **Headline Font**: Inter
- **Body Font**: Inter
- **Label Font**: Inter

Headlines use semi-bold weight. Body text uses regular weight at 14–16px.
Labels use medium weight at 12px with uppercase for section headers.

## Elevation
This design uses no shadows. Depth is conveyed through border contrast
and surface color variation (surface, surface-container, surface-bright).

## Components
- **Buttons**: Rounded (8px), primary uses brand blue fill, secondary uses outline
- **Inputs**: 1px border, surface-variant background, 12px padding
- **Cards**: No elevation, 1px outline border, 12px corner radius

## Do's and Don'ts
- Do use the primary color only for the single most important action per screen
- Don't mix rounded and sharp corners in the same view
- Do maintain WCAG AA contrast ratios (4.5:1 for normal text)
- Don't use more than two font weights on a single screen
```

If the user provides a project-specific template, follow that template exactly and keep the content concise, semantically descriptive, and grounded in the strongest available source material.

## Usage Example

To use this skill for a feature brief:

1. **Read the source material:**
   - Review the PRD, brief, or supporting notes

2. **Optionally enrich with visuals:**
   - If Stitch assets exist, use them to validate the tone, palette, and component language

3. **Analyze and synthesize:**
   - Extract relevant design tokens, behavioral cues, and layout principles
   - Translate technical values into descriptive language
   - Organize information according to the `DESIGN.md` structure

4. **Generate the file:**
   - Create `DESIGN.md` in the project directory
   - Follow the prescribed format exactly
   - Ensure all color codes are accurate when source values exist
   - Use evocative, designer-friendly language

## Best Practices

- **Be Descriptive:** Avoid generic terms like "blue" or "rounded." Use "Ocean-deep Cerulean (#0077B6)" or "Gently curved edges"
- **Be Functional:** Always explain what each design element is used for
- **Be Consistent:** Use the same terminology throughout the document
- **Be Visual:** Help readers visualize the design through your descriptions
- **Be Precise:** Include exact values (hex codes, pixel values) in parentheses after natural language descriptions

## Tips for Success

1. **Start with the big picture:** Understand the overall aesthetic before diving into details
2. **Look for patterns:** Identify consistent spacing, sizing, and styling patterns
3. **Think semantically:** Name colors by their purpose, not just their appearance
4. **Consider hierarchy:** Document how visual weight and importance are communicated
5. **Reference the guide:** Use language and patterns from the Stitch Effective Prompting Guide

## Common Pitfalls to Avoid

- ❌ Using technical jargon without translation (e.g., "rounded-xl" instead of "generously rounded corners")
- ❌ Omitting color codes or using only descriptive names
- ❌ Forgetting to explain functional roles of design elements
- ❌ Being too vague in atmosphere descriptions
- ❌ Ignoring subtle design details like shadows or spacing patterns
