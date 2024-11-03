# DataWeave Scripts

## 1. filter
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Ffilter"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
{
	"status": "success",
	"data": [
		{
			"id": "1",
			"employee_name": "Tiger Nixon",
			"employee_salary": 320800,
			"employee_age": 61,
			"profile_image": ""
		},
		{
			"id": "2",
			"employee_name": "Garrett Winters",
			"employee_salary": 170750,
			"employee_age": 63,
			"profile_image": ""
		},
		{
			"id": "3",
			"employee_name": "Ashton Cox",
			"employee_salary": 86000,
			"employee_age": 58,
			"profile_image": ""
		},
		{
			"id": "4",
			"employee_name": "Cedric Kelly",
			"employee_salary": 433060,
			"employee_age": 22,
			"profile_image": ""
		}
	]
}
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
  {
    "id": "4",
    "employee_name": "Cedric Kelly",
    "employee_salary": 433060,
    "employee_age": 22,
    "profile_image": ""
  }
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
---
payload.data filter ((item, index) -> item.employee_age <= 22)
  ```
</details>

## 2. map
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fmap"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
[
	{
		"name": "Jane"
	},
	{
		"name": "John"
	},
	{
		"name": "Joe"
	}
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	{
		"user 1": "Jane"
	},
	{
		"user 2": "John"
	},
	{
		"user 3": "Joe"
	}
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
---
payload map ((item, index) -> {
    ("user " ++ (index +1)) : item.name
})
  ```
</details>

## 3. zip
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fzip"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input 1</summary>

  ```json
[
	"12345",
	"67890"
]
  ```
</details>
<details>
  <summary>Input 2</summary>

  ```json
[
	"abc",
	"xyz"
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	[
		"12345",
		"abc"
	],
	[
		"67890",
		"xyz"
	]
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
import leftJoin from dw::core::Arrays
var otherInput = [
	"abc",
	"xyz"
]
---
payload zip otherInput
  ```
</details>

## 4. distinctBy
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2FdistinctBy"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
{
	"array1": [
		1,
		2,
		3,
		5,
		6,
		7
	],
	"array2": [
		5,
		7,
		1,
		3,
		8,
		4
	]
}
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	8,
	7,
	6,
	5,
	4,
	3,
	2,
	1
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
---
((payload.array1 ++ payload.array2) distinctBy $)  orderBy -$
  ```
</details>

## 5. substringAfter
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2FsubstringAfter"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
[
	{
		"fullname": "Grace Kelly",
		"age": "22",
		"hiredate": "October 15, 2005",
		"product": "Printer"
	},
	{
		"fullname": "Cary Grant",
		"age": "32",
		"hiredate": "October 20, 2005",
		"product": "Desktop"
	},
	{
		"fullname": "Clark Gable",
		"age": "42",
		"hiredate": "October 25, 2005",
		"product": "Keyboard"
	}
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```xml
<?xml version='1.0' encoding='UTF-8'?>
<employees>
	<employee>
		<name age="22">
			<lastname>Kelly</lastname>
			<firstname>Grace</firstname>
		</name>
		<hiredate>October 15, 2005</hiredate>
		<projects>
			<project>
				<product>Printer</product>
			</project>
		</projects>
	</employee>
	<employee>
		<name age="32">
			<lastname>Grant</lastname>
			<firstname>Cary</firstname>
		</name>
		<hiredate>October 20, 2005</hiredate>
		<projects>
			<project>
				<product>Desktop</product>
			</project>
		</projects>
	</employee>
	<employee>
		<name age="42">
			<lastname>Gable</lastname>
			<firstname>Clark</firstname>
		</name>
		<hiredate>October 25, 2005</hiredate>
		<projects>
			<project>
				<product>Keyboard</product>
			</project>
		</projects>
	</employee>
</employees>
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
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
  ```
</details>

## 6. reduce
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Freduce"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
{
	"data1": [
		{
			"p_name": "3",
			"p_val": "4"
		},
		{
			"p_name": "7",
			"p_val": "8"
		},
		{
			"p_name": "1",
			"p_val": "2"
		}
	],
	"data2": [
		{
			"p_name": "1",
			"p_val": "2"
		},
		{
			"p_name": "3",
			"p_val": "4"
		},
		{
			"p_name": "5",
			"p_val": "6"
		}
	]
}
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
{
	"1": "2",
	"3": "4",
	"5": "6",
	"7": "8"
}
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
---
(((payload.data1 ++ payload.data2) map ((item, index) -> (item.p_name): item.p_val) distinctBy $) reduce ((item, accumulator) -> item ++ accumulator)) orderBy $
  ```
</details>

## 7. groupBy
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2FgroupBy"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
[
	{
		"id": "123",
		"name": "rakesh",
		"dept": "cse"
	},
	{
		"id": "234",
		"name": "kumar",
		"dept": "cse"
	},
	{
		"id": "456",
		"name": "suraj",
		"dept": "IT"
	},
	{
		"id": "489",
		"name": "prakash",
		"dept": "IT"
	}
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	{
		"cse": [
			"rakesh",
			"kumar"
		]
	},
	{
		"IT": [
			"suraj",
			"prakash"
		]
	}
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
---
payload groupBy ((item, index) -> item.dept) pluck ((value, key, index) -> (key):value.name)
  ```
</details>

## 8. contains
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fcontains"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
[
	{
		"name": "Abc",
		"address": "Mumbai",
		"phone": "91-1234567891",
		"id": 123
	},
	{
		"name": "Pqr",
		"address": "Pune",
		"phone": "91-1234985438",
		"id": 456
	},
	{
		"name": "Abc",
		"address": "Delhi",
		"phone": "91-1234567891",
		"id": 341
	}
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	{
		"name": "Abc",
		"address": "Mumbai",
		"phone": "91-1234567891",
		"id": 123,
		"sid": 123,
		"postalCode": "67890",
		"country": "USA"
	},
	{
		"name": "Pqr",
		"address": "Pune",
		"phone": "91-1234985438",
		"id": 456,
		"sid": 456,
		"postalCode": "54983",
		"country": "UK"
	},
	{
		"name": "Abc",
		"address": "Delhi",
		"phone": "91-1234567891",
		"id": 341,
		"sid": 341,
		"postalCode": "27932",
		"country": "EU"
	}
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
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
  ```
</details>

## 9. map
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fmap1"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```xml
<order>
	<orderId>12345</orderId>
	<customer>
		<firstName>John</firstName>
		<lastName>Doe</lastName>
	</customer>
	<items>
		<item>
			<productName>Laptop</productName>
			<quantity>2</quantity>
			<price>1200.00</price>
		</item>
		<item>
			<productName>Printer</productName>
			<quantity>1</quantity>
			<price>300.00</price>
		</item>
	</items>
</order>
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
{
  "orderId": "12345",
  "customerName": "John Doe",
  "totalAmount": 1500,
  "items": [
    {
      "productName": "Laptop",
      "quantity": "2"
    },
    {
      "productName": "Printer",
      "quantity": "1"
    }
  ]
}
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
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
  ```
</details>

## 10. pluck
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fpluck"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```xml
<notes>
	<note>
		<to>Srikant</to>
		<from>Candidate</from>
		<heading>Questions</heading>
		<body>Answer that! wowo</body>
	</note>
	<note>
		<to>Ankit</to>
		<from>Candidate2</from>
		<heading>Questions</heading>
		<body>Answer that! wowo</body>
	</note>
	<note>
		<to>Aditya</to>
		<bcc>Sunita</bcc>
		<from>Candidate3</from>
		<heading>Questions</heading>
		<body>Answer that! wowo</body>
	</note>
</notes>
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	{
		"to": [
			"Srikant",
			"Ankit",
			"Aditya"
		]
	},
	{
		"from": [
			"Candidate",
			"Candidate2",
			"Candidate3"
		]
	},
	{
		"heading": [
			"Questions",
			"Questions",
			"Questions"
		]
	},
	{
		"body": [
			"Answer that! wowo",
			"Answer that! wowo",
			"Answer that! wowo"
		]
	},
	{
		"bcc": [
			"Sunita"
		]
	}
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json
---
payload.notes mapObject ((value) -> value ) groupBy ((value, key) -> key) pluck ((value, key, index) -> (key) : valuesOf(value))
  ```
</details>

## 11. pluck
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fpluck1"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
[
	{
		"Fruit": "apple",
		"quantity": "14"
	},
	{
		"Fruit": "orange",
		"quantity": "13"
	},
	{
		"Fruit": "apple",
		"quantity": "6"
	},
	{
		"Fruit": "orange",
		"quantity": "12"
	}
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	{
		"Fruit": "apple",
		"quantity": 20
	},
	{
		"Fruit": "orange",
		"quantity": 25
	}
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json  
---
payload groupBy ((item, index) -> item.Fruit) pluck ((value, key, index) -> {
  "Fruit": (key),
  "quantity": sum(value.quantity)
})
  ```
</details>

## 12. reduce
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Freduce1"><img width="200" src="/images/dataweave-playground-button.jpeg" style="box-shadow: 10px 10px rgba(0, 0, 0, 0.6)"><a>

<details>
  <summary>Input</summary>

  ```json
[
	[
		{
			"name": "john",
			"gender": "M"
		},
		{
			"name": "leonardo",
			"gender": "M"
		}
	],
	[
		{
			"name": "leonardo",
			"gender": "M"
		},
		{
			"name": "alicia",
			"gender": "F"
		},
		{
			"name": "jennifer",
			"gender": "F"
		},
		{
			"name": "john",
			"gender": "M"
		}
	]
]
  ```
</details>
<details>
  <summary>Output</summary>

  ```json
[
	"Mr.john",
	"Mr.leonardo",
	"Ms.alicia",
	"Ms.jennifer"
]
  ```
</details>
<details>
  <summary>Transform</summary>

  ```dataweave
%dw 2.0
output application/json  
---
((payload map ((item, index) -> item) reduce ((val, acc) -> acc ++ val)) map ((item1, index1) -> {
  "name": (if (item1.gender == "F")
    "Ms."
  else
    "Mr.") ++ item1.name
}) distinctBy $) map ((item, index) -> item.name)
  ```
</details>