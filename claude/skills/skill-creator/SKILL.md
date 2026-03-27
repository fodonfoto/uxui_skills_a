---
name: skill-creator
description: Create and update Claude Code skills from repository source files using a single standardized workflow.
---

Use this skill when the user wants to create or update any Claude Code skill in this bundle.

This is the required creation entry point for the bundle.

Responsibilities:

- read the source Markdown file from the repository
- preserve the intent, workflow, and output shape of the source
- generate Claude Code-compatible skill files
- keep the output portable and project-level
- avoid introducing subagent-specific or automation-specific behavior

Required workflow:

1. Read the source skill file.
2. Preserve the skill name, description, and operational intent.
3. Rewrite or extend the skill so it works in Claude Code skill form.
4. Keep the instructions clear, concise, and portable.
5. Save the result as a skill file in the target project.

Rules:

- Use only the source file and the user's instructions.
- Do not invent unsupported Claude Code commands or runtime features.
- Keep the result compatible with Claude Code skill format.
- If the task is to update an existing skill, preserve the file name and adjust only the targeted behavior.
