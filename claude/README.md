# Claude Code Bundle

This folder contains Claude Code-compatible subagents for the same workflows as the Codex bundle.

## What Is Included

- `.claude/agents/prd-brief.md`
- `.claude/agents/professor-ux.md`
- `.claude/agents/stitch.md`
- `.claude/agents/stitch-loop.md`
- `.claude/agents/design-md.md`

## What Is Not Included

- automations
- Codex-specific bundle files
- local-only machine configuration

## Install

Claude Code reads project-level subagents from `.claude/agents/` and project settings from `.claude/settings.json`.

To use this bundle in a Claude Code project:

1. Copy the `claude/.claude/` folder into the root of your Claude Code project.
2. Keep the agent files as Markdown with YAML frontmatter.
3. Add project settings in `.claude/settings.json` if you need permissions or additional configuration.
4. Use the subagents by name inside Claude Code when a task matches their expertise.

## Create New Subagent

Claude Code's practical creation flow is the `/agents` command. Use it when you want Claude to create a new subagent from one of the Markdown files in this bundle.

See [AGENT_CREATION_GUIDE.md](./AGENT_CREATION_GUIDE.md) for copy-paste prompts.

## Notes

- Each agent file is written to be project-level and portable.
- `stitch`, `stitch-loop`, and `design-md` expect Stitch access in the target project.
- `professor-ux` expects Figma access when live canvas review is needed.
