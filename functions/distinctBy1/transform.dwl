%dw 2.0
output application/json  
---
((payload groupBy ((item, index) -> item.skill) pluck ((value, key, index) -> value)) reduce ((val, acc) -> acc ++ val)) distinctBy $.id