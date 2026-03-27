# Claude Code Subagent Creation Guide

In this bundle, `skill-creator` is the single standardized entry point for creating or updating Claude Code subagents.

Claude Code's practical command for reaching that workflow is `/agents`.

Use the Markdown files in `.claude/agents/` as source material when creating or updating a new project-level subagent.

## Recommended Creation Flow

1. Open your Claude Code project.
2. Run `/agents`.
3. Choose **Create New Subagent**.
4. Delegate the task to the `skill-creator` agent.
5. Point it at one of the source files in this repo.
6. Ask it to preserve the intent, workflow, and output format.
7. Save the result as `.claude/agents/<name>.md`.

## Copy-Paste Prompts

### PRD + Brief

```text
Use /agents to create or update the `skill-creator` entry point from this source file:
https://github.com/fodonfoto/uxui_skills_a/blob/main/claude/.claude/agents/prd-brief.md

Keep the result compatible with Claude Code, preserve the workflow, and write the final agent to `.claude/agents/prd-brief.md`.
```

### Professor UX

```text
Use /agents to create or update the `skill-creator` entry point from this source file:
https://github.com/fodonfoto/uxui_skills_a/blob/main/claude/.claude/agents/professor-ux.md

Keep the result compatible with Claude Code, preserve the audit workflow, and write the final agent to `.claude/agents/professor-ux.md`.
```

### Stitch

```text
Use /agents to create or update the `skill-creator` entry point from this source file:
https://github.com/fodonfoto/uxui_skills_a/blob/main/claude/.claude/agents/stitch.md

Keep the result compatible with Claude Code, preserve the Stitch workflow, and write the final agent to `.claude/agents/stitch.md`.
```

### Stitch Loop

```text
Use /agents to create or update the `skill-creator` entry point from this source file:
https://github.com/fodonfoto/uxui_skills_a/blob/main/claude/.claude/agents/stitch-loop.md

Keep the result compatible with Claude Code, preserve the iterative build loop, and write the final agent to `.claude/agents/stitch-loop.md`.
```

### design-md

```text
Use /agents to create a new project-level subagent from this source file:
https://github.com/fodonfoto/uxui_skills_a/blob/main/claude/.claude/agents/design-md.md

Keep the result compatible with Claude Code, preserve the design-system synthesis workflow, and write the final agent to `.claude/agents/design-md.md`.
```

### skill-creator

```text
Use /agents to create or update the `skill-creator` entry point from this source file:
https://github.com/fodonfoto/uxui_skills_a/blob/main/claude/.claude/agents/skill-creator.md

Keep the result compatible with Claude Code, preserve the creation workflow, and write the final agent to `.claude/agents/skill-creator.md`.
```

## Notes

- Claude Code subagents are Markdown files with YAML frontmatter.
- Keep the frontmatter short and the workflow explicit.
- If the target project needs extra permissions or configuration, add them in `.claude/settings.json`.
