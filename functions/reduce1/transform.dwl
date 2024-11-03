%dw 2.0
output application/json  
---
((payload map ((item, index) -> item) reduce ((val, acc) -> acc ++ val)) map ((item1, index1) -> {
  "name": (if (item1.gender == "F")
    "Ms."
  else
    "Mr.") ++ item1.name
}) distinctBy $) map ((item, index) -> item.name)