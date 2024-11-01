%dw 2.0
output application/json
import leftJoin from dw::core::Arrays
var otherInput = [
	"abc",
	"xyz"
]
---
payload zip otherInput