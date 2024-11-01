%dw 2.0
output application/json
---
(((payload.data1 ++ payload.data2) map ((item, index) -> (item.p_name): item.p_val) distinctBy $) reduce ((item, accumulator) -> item ++ accumulator)) orderBy $