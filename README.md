# UX/UI Skills Pack

This repository now exposes two public-ready bundle folders:

- `codex/` - the Codex-native mirror of the full bundle, including skills and automation
- `claude/` - the Claude Code-compatible bundle, with no automation

The repository root still keeps the earlier files for backward compatibility, but the bundle folders are the canonical entry points.

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

- `codex/` mirrors the Codex-native bundle in the repository root, including the full public skill set and automation.
- `claude/` includes Claude Code subagents for `PRD+BRIEF`, `professor-ux`, `stitch`, `stitch-loop`, and `design-md`.
- This repo intentionally excludes `figma-cli-local`.
- If you need local machine wiring, keep it in a separate private repo or convert it to placeholders first.
