# DataWeave Scripts

## filter
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Ffilter"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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

## map
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fmap"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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

## zip
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fzip"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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

## distinctBy
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2FdistinctBy"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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

## substringAfter
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2FsubstringAfter"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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

## reduce
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Freduce"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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

## groupBy
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2FgroupBy"><img width="300" src="/images/dataweave-playground-button.JPG"><a>

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