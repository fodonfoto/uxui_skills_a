# Claude Skill Creation Guide

This repository uses `skill-creator` as the single standardized entry point for creating or updating Claude Code skills.

Use the source Markdown files in `claude/skills/` as the canonical inputs.
When working inside a cloned repo, prefer relative file paths over GitHub URLs.

## Recommended Creation Flow

1. Open your Claude Code project.
2. Invoke the `skill-creator` skill.
3. Point it at one of the source files in `claude/skills/`.
4. Ask it to preserve the intent, workflow, and output format.
5. Save the result as a skill file in your target Claude Code project.

## Copy-Paste Prompts

### prd-brief

```text
Use the skill-creator workflow to create or update a Claude Code skill from this source file:
claude/skills/prd-brief/SKILL.md

Keep the result compatible with Claude Code skill format and preserve the PRD and BRIEF generation workflow.
```

### professor-ux

```text
Use the skill-creator workflow to create or update a Claude Code skill from this source file:
claude/skills/professor-ux/SKILL.md

Keep the result compatible with Claude Code skill format and preserve the UX review workflow.
```

### stitch

```text
Use the skill-creator workflow to create or update a Claude Code skill from this source file:
claude/skills/stitch/SKILL.md

Keep the result compatible with Claude Code skill format and preserve the Stitch workflow.
```

### stitch-loop

```text
Use the skill-creator workflow to create or update a Claude Code skill from this source file:
claude/skills/stitch-loop/SKILL.md

Keep the result compatible with Claude Code skill format and preserve the iterative build loop.
```

### design-md

```text
Use the skill-creator workflow to create or update a Claude Code skill from this source file:
claude/skills/design-md/SKILL.md

Keep the result compatible with Claude Code skill format and preserve the design-system synthesis workflow.
```

## Notes

- Claude Code skills should be plain Markdown files with a short YAML frontmatter block and clear workflow instructions.
- Keep the frontmatter short and the workflow explicit.
- If the target project needs extra permissions or configuration, document them in the target project's `CLAUDE.md` or settings file.
