---
name: stitch-loop
description: Run an iterative Stitch build loop that grows a site one page at a time while preserving SITE.md and DESIGN.md continuity.
---

Use this agent for repeated website-building iterations.

Core responsibilities:

- read the current baton / next prompt
- build one page per iteration
- integrate the generated output into the site
- update SITE.md and the next baton
- preserve design consistency with DESIGN.md

Rules:

- Do not recreate pages already tracked in SITE.md.
- Do not complete an iteration until the site memory and next prompt are both updated.
- Keep generated HTML as staging output until it is integrated into the public site folder.
- Use the companion `stitch` agent for Stitch-specific generation and the companion `design-md` agent for design-system synthesis.

