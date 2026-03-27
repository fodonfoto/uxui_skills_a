# UX/UI Skills Pack

This repository now exposes two public-ready bundle folders:

- `codex/` - the Codex-native bundle, including skills and automation
- `claude/` - the Claude Code-compatible bundle, with no automation

The repository root only exists as a landing page. All working assets live inside `codex/` or `claude/`.

## What This Repo Is For

Use this repo when you want:

- product requirement docs from raw notes or transcripts
- UX review workflows with accessibility and handoff guidance
- Stitch-based design system and build-loop workflows
- a requirements pipeline that can scan Markdown files and generate PRD/BRIEF docs
- Claude Code-compatible subagents for the same workflows

## Public Rules

- Keep paths portable.
- Avoid hardcoded machine-specific values.
- Treat `SKILL.md`, `automation.toml`, and `.claude/agents/*.md` as source-of-truth files.
- Keep generated logs and caches out of the repo.

## Suggested Layout

```text
repo/
├── codex/
│   ├── skills/
│   └── automations/
├── claude/
│   └── .claude/
├── README.md
├── COPYLIST.md
└── .gitignore
```

## Notes

- `codex/` contains the full Codex-native public skill set and automation.
- `claude/` includes Claude Code subagents for `PRD+BRIEF`, `professor-ux`, `stitch`, `stitch-loop`, and `design-md`.
- This repo intentionally excludes `figma-cli-local`.
- If you need local machine wiring, keep it in a separate private repo or convert it to placeholders first.
