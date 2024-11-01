%dw 2.0
output application/json
---
payload.data filter ((item, index) -> item.employee_age <= 22)