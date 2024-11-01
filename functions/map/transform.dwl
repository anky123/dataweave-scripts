%dw 2.0
output application/json
---
payload map ((item, index) -> {
    ("user " ++ (index +1)) : item.name
})