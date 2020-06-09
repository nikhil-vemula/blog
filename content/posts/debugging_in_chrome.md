---
title: "Debugging in chrome"
date: 2020-06-07T17:09:24+05:30
type: post
---

## $ and $$

$ - querySelector  
$$ - querySelectorAll  

```js
$('button') // document.querySelector("button")
$$('button') // document.querySelectorAll("button");
```

## Inspect

Print the dom of element to the console.

```js
inspect($('button'));
```

## Monitor and unmonitor

Monitor a when a function is triggered.

```js
monitor("<function_name>");
unmonitor("<function_name>");
```

## Keys and values

Print keys or values of an object.

```js
keys(myObj);
values(myObj);
```

## Table

Print a object in table format

```js
table(myObj);
```
