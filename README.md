# UX/UI Skills Pack

This repository contains a small public bundle of Codex skills and one automation that are safe to fork, clone, and adapt.

## Included

- `PRD+BRIEF`
- `professor-ux`
- `stitch`
- `stitch-loop`
- `design-md`
- `automations/global-requirements-pipeline`

## What This Pack Is For

Use this bundle when you want:

- product requirement docs from raw notes or transcripts
- UX review workflows with accessibility and handoff guidance
- Stitch-based design system and build-loop workflows
- a requirements pipeline that can scan Markdown files and generate PRD/BRIEF docs

## Public Rules

- Keep paths portable.
- Avoid hardcoded machine-specific values.
- Treat `SKILL.md` and `automation.toml` as the source of truth.
- Keep all generated logs and caches out of the repo.

## Suggested Layout

```text
repo/
├── README.md
├── COPYLIST.md
├── .gitignore
├── skills/
│   ├── PRD+BRIEF/
│   ├── professor-ux/
│   ├── stitch/
│   ├── stitch-loop/
│   └── design-md/
└── automations/
    └── global-requirements-pipeline/
```

## Notes

- This pack intentionally excludes `figma-cli-local`.
- If you need local machine wiring, keep it in a separate private repo or convert it to placeholders first.

