%dw 2.0
output application/xml
import * from dw::core::Strings
---
employees : {
    employee: payload map ((item, index) -> {
        name: {
            lastname : substringAfter(item.fullname, " "), 
            firstname : substringBefore(item.fullname, " ")
        },
        hiredate : item.hiredate,
        projects : project : product : item.product
    })
}