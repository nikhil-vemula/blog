---
title: "Javascript"
date: 2020-06-07T17:09:24+05:30
type: post
---

## Global object and this object

A default global object and this object are created by the javascript engine by default.

### Hoisitng

There two phases when the javascript code is run, declaration and execution. During the declaration phase memory is allocated for all the functions and variables as name/value pairs.

```js
console.log(myVar);
b();

var myVar = 1;
function b() {
    console.log("Hello!");
}
```

### Lexical scoping

The place where the function or variable is defined matters.

### Execution context stack

It is created for each function invocation. Declaration and execution phases runs for each invocation again.

### Scope chain

If the variable is not found in the current scope, then it searches in the scope where the function is defined(not called).

```js
function b(){
    console.log(myVar);
}

function a(){
    var myVar = 2;
    b();
}

var myVar = 1;
a();
```

### Javascript is dynamic typed language

### Coercion

Use `===` for strict comparison.

```js
3 < 2 < 1
```

### Existence check

```js
if (myVar) {
    // myVar != undefined, null or ""
}
```

### Objects

Objects can have 3 types as properties

* Primitive
* Object
* Function

### JSON and Object

JSON: Javascript object notation.
All JSON's are objects but not vice versa.

### Functions

* Functions are first class citzens in javascript (Things that can be performed on objects can also be performed on the functions).

```js
function greet() {
    console.log("Hello!");
}
// Language property is assigned to the greet function object.
greet.language = "english";
```

* Functions can have following properties
  * Primitive
  * Object
  * Function
  * Name
  * Code
* Function statement vs Function expression

    | statement | expression |
    | --------- | ----------|
    | `function greet() {console.log("hello")}` | `var greet = function() {console.log("hello")}`

* Function and this

```js
console.log(this);

function a(){
    console.log(this);
}
a();

b = function() {
    console.log(this);
};
b();

var c = {
 fn: function(){
     console.log(this);
     function d(){
         console.log(this);
     }
     d();
 }
}
c.fn();
```

### Automatic `';'` insertion

```js
function getPerson() {
    return
    {
        firstName = "Nick"
    }
}
```

### IIFE

```js
(function(){
    var privateVar = "hello";
}());
```

### Closures

```js
function greet(whattosay){
    return function(name){
        console.log(whattosay + ' ' + name);
    }
}
```

### call, apply and bind

While creating the execution context, point `this` to some other object instead of window.

### Currying

Creating a copy of function with some preset parameters

```js
function multiply(a, b) {
    return a*b;
}
let multiplyBy2 = multiply.bind(this, 2); // Set a value permanently to 2
```

### Functional programming

### Prototypal inheritance

Each object has a proto property

## References

<https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness>
