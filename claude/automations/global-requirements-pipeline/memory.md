# Memory

- Last run summary: hardened the backlog-reference lookup so the automation always uses absolute paths and does not depend on the current working directory.
- Decision: keep `cwds` focused on the scan root, but resolve reference files from the automation folder explicitly.
- Current run time: 2026-04-03T05:16:00Z
