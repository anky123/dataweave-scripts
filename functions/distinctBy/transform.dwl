%dw 2.0
output application/json
---
((payload.array1 ++ payload.array2) distinctBy $)  orderBy -$