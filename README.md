# DataWeave Scripts

## filter
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Ffilter"><img width="300" src="/images/dwplayground-button.png"><a>

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
<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=anky123%2Fdataweave-scripts&path=functions%2Fmap"><img width="300" src="/images/dwplayground-button.png"><a>

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
