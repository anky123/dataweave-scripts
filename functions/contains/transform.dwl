%dw 2.0
var otherArray = [
  {
    "sid": 123,
    "postalCode": "67890",
    "country": "USA"
  },
  {
    "sid": 456,
    "postalCode": "54983",
    "country": "UK"
  },
  {
    "sid": 341,
    "postalCode": "27932",
    "country": "EU"
  }
]
output application/json  
---
payload map (array1Value) -> {
  (otherArray filter ($.sid contains array1Value.id) map (array2Value) -> {
    name: array1Value.name,
    address: array1Value.address,
    phone: array1Value.phone,
    id: array1Value.id,
    sid: array2Value.sid,
    postalCode: array2Value.postalCode,
    country: array2Value.country
  })
}