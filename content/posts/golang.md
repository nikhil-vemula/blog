---
title: "Go lang"
date: 2020-06-07T17:09:24+05:30
type: post
---
* Go lang is strong and statically typed.

## Features

* Simplicity
* Fast compile times
* Garbage collection
* Built in cocunrrency
* Compiles to standalone libraries.

## Code organization

> [https://golang.org/doc/code.html](https://golang.org/doc/code.html)

Summary

* Go programs are organized into packages.
* A package is a collection of source files in the same directory that are compiled together.
* Functions, types, variables, and constants defined in one source file are visible to all other source files within the same package.

## Variables

```go
package main

var i float32 = 32 // Global
func main() {
    var i int = 10; // Explicit type specification
    i:= 10; // Implicit type infered
}
```

### Primitives

* Boolean
* Numeric
  * Integer
  * Floating
  * Complex number
* Text

## Arrays and slices

```go
var fruits [2]string // Array
var fruits []string // Slice
```

## Maps

```go
var details := map[string]string{"fname":"nikhil", "lname":"vemula"}
```

### Range

```go
var ids:= []int{12, 13, 14, 15}

for i, id := range ids {
  fmt.Println("%d - ID: %d", i, id);
}

for _, id := range ids {
  fmt.Println("ID: %d", i, id);
}

var details := map[string]string{"fname":"nikhil", "lname":"vemula"}

for k, v := range details {
  fmt.Println("%s: %s", k, v);
}
```

## Pointers

```go
package main

func main() {
  a:= 5
  b:= &a

  fmt.Println(b); // address
  fmt.Println(*b); // Value

  *b := 10
  fmt.Println(a);
}
```

## Closures

## Structs

```go
struct Person{
  fname string
  lname string
}

// Valure reciever
func (p Person) greet() string {
  return "Hello" + p.fname
}

var person = Person{fname: "nikhil", lname: "vemula"}
```

## Interfaces
