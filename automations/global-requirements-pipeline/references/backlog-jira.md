# Backlog Prompt: Jira

Use Jira MCP to turn a PRD into a Jira backlog.
ตอบผู้ใช้เป็นภาษาไทยทั้งหมด
ถ้าจำเป็นต้องใช้คำทับศัพท์หรือคำเทคนิค ให้คงคำนั้นไว้และอธิบายสั้น ๆ เป็นภาษาไทยในวงเล็บครั้งแรกที่ใช้
เขียนให้อ่านง่าย เป็นมิตร และไม่ใช้ภาษาทางการเกินไป

## Goal
Read the PRD and create a backlog structure:
- Epics
- Stories
- Tasks

## Rules
- Use the PRD only.
- Do not invent missing scope.
- If something is unclear, mark it as `[AMBIGUOUS]` or `[DRAFT]`.
- Create items in Jira only.
- Stop if any MCP call fails.

## Process
1. Group Functional Requirements into 1-3 Epics based on goals or user flows.
2. Create Epic items first.
3. Create one Story per FR as the default.
4. Create 1-4 Tasks per Story if needed.
5. Report the created keys and URLs back to the user.

## Output
- Epic count
- Story count
- Task count
- One example Story with links
