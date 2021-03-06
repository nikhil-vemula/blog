---
title: "Go lang"
date: 2020-06-07T17:09:24+05:30
type: post
---
* Go lang is strong and statically typed.
* Go is not Object oriented programming language.

## Features

* Simplicity
* Fast compile times
* Garbage collection
* Built in cocunrrency
* Compiles to standalone libraries.

## Hello world

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello world!!")
}
```

```bash
go run main.go
```

### Go CLI

* go build : compiles a bunch of source files
* go run : compiles and run
* go fmt : Format the code
* go install : Compiles and installs a package
* go get : Downloads source code of someone ele's package.
* go test : Run tests associated with project

### Parts of hello world

#### Package

Group the source files together some thing like namespace

Types:

* Executable packages : `package main` and `func main()` makes it executable packages.
* Reusable packages

#### Import

Import other packages to use it in the program.
> Standard packages at [https://golang.org/pkg/](https://golang.org/pkg/)

## Variables

Go is static type language.

```go
package main

var i float32 = 32 // Global
func main() {
    var i int = 10; // Explicit type specification
    i := 10; // Implicit type infered
    i = 20 // Assignment
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

Array : Fixed size
Slice : Can grow or shrink. But all the elements should be of same type.

```go
var fruits [2]string // Array
var fruits []string // Slice
```

## Functions

We need to annotate the return value type.

```go
func add(a int, b int) int {
  return a + b;
}
```

### Recievers Function

Any variable of type deck will have access to function print.

```go
func (d deck) print() {

}
```

### Multiple return values

```go
func chooseYourPokemon() (string, string, string) {
  return "Charmander", "Bulbusar", "Squirtle"
}
```

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

## Pointers

Go is a pass by value language

> `* : Dereferences a pointer`  
> `& : Address of the type`

* Value types: int, float, string, bool, structs
* Reference types: slices, maps, channels, pointers, functions

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

## Closures

```go
```

## Interfaces

An interface type is defined by a set of methods. A value of interface type can hold any value that implements those methods.

```go
package main

import "fmt"

type triangle struct {
	base   float64
	height float64
}

type square struct {
	side float64
}

type shape interface {
	getArea() float64
}

func (t triangle) getArea() float64 {
	return 0.5 * t.base * t.height
}

func (s square) getArea() float64 {
	return s.side * s.side
}

func PrintArea(s shape) {
	fmt.Println(s.getArea())
}

func main() {
	tri := triangle{10, 20}
	squ := square{5}

	PrintArea(tri)
	PrintArea(squ)
}

```

## Go routines

A function can be called as a subroutine for concurrency

## Channel

* Can be used to communicate between the sub rouitines.
* Channel can be of a given data type.

```go
package main

import (
	"fmt"
	"net/http"
	"time"
)

func main() {
	links := []string{
		"https://www.google.com",
		"https://www.facebook.com",
		"https://www.stackoverflow.com",
		"https://www.golang.org",
		"https://www.amazon.com",
	}

	c := make(chan string)

	for _, link := range links {
		go checkLink(link, c)
	}

	for l := range c {
		go func(link string) {
			time.Sleep(2 * time.Second)
			checkLink(link, c)
		}(l)
	}
}

func checkLink(link string, c chan string) {
	_, err := http.Get(link)

	if err != nil {
		fmt.Println(link, " is down", err)
		c <- link
		return
	}
	fmt.Println(link, " is up")
	c <- link
}

```


## Code organization

> [https://golang.org/doc/code.html](https://golang.org/doc/code.html)

Summary

* Go programs are organized into packages.
* A package is a collection of source files in the same directory that are compiled together.
* Functions, types, variables, and constants defined in one source file are visible to all other source files within the same package.
