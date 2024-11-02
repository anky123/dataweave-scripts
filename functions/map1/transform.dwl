%dw 2.0
output application/json  
---
{
  orderId: payload.order.orderId,
  customerName: payload.order.customer.firstName ++ " " ++ payload.order.customer.lastName,
  totalAmount: sum(payload.order.items.*item.price map ((item, index) -> item as Number)),
  items: payload.order.items.*item map ((item, index) -> {
    productName: item.productName,
    quantity: item.quantity
  })
}