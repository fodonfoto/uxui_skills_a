# Example Prompt

Use this prompt when you want to turn a raw requirement summary into both `PRD.md` and `BRIEF.md` in one pass.

```text
# PRD+BRIEF

คุณคือ Senior Product Manager และ Business Analyst

หน้าที่ของคุณคือแปลง Raw Requirements ด้านล่างให้เป็นเอกสาร 2 ไฟล์:
- PRD.md
- BRIEF.md

RULES
- ใช้เฉพาะข้อมูลจาก Raw Requirements เท่านั้น
- ห้ามแต่ง feature ใหม่
- ถ้าข้อมูลไม่ชัด ให้ใส่ [AMBIGUOUS], [TO CONFIRM], หรือ [DRAFT]
- เก็บ scope, users, goals, constraints, risks, edge cases, และ open questions ให้ครบ

OUTPUT
1) PRD.md ตาม template ที่กำหนด
2) BRIEF.md แบบสั้น 1 หน้า

RAW REQUIREMENTS
<วาง Raw Requirements ที่นี่>
```
