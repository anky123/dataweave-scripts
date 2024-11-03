%dw 2.0
output application/json
---
payload.notes mapObject ((value) -> value ) groupBy ((value, key) -> key) pluck ((value, key, index) -> (key) : valuesOf(value))