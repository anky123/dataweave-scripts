%dw 2.0
output application/json  
---
payload groupBy ((item, index) -> item.Fruit) pluck ((value, key, index) -> {
  "Fruit": (key),
  "quantity": sum(value.quantity)
})