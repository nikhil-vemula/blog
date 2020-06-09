---
title: "Type Script"
date: 2020-06-07T17:09:24+05:30
type: post
---

TypeScript is super script of javascript. It can be compiled to javascript to use it in modern broswers.

## Types

### Core types

1. number: `1, 5.2, -10`
2. string: ```'Hi', "Hi", `Hi` ```  
3. boolean: `true, false`
4. object: `{name: 'nikhil'}`
5. Array: `[1, 2]`
6. Tuple [Typescript]: `[1, 2]` Array of fixed length
7. Enum [Typescript]: `enum{ NEW, OLD}`
8. Any: `*`

### Type inference and assignment

Type script inferes the type of the variable from the assignment.

```ts
// Type is inferred as number implicitly
let count = 0;
count = '0'; // Compilation error
```

Type can be specified explicitly if the value is assigned later.

```ts
let count: number;
count = 0;
```

**Note:** It is redundant to specify the type of variable during assignment.

```ts
// Not necessary
let count: number = 0;
```

Examples:

| Variable | Inferred as|
|---|---|
| let count = 0;|number|
| let name = 'nikhil';|string|
| let tellingLies = true;| boolean|
| let me = {name:'nikhil'}| object: {name:string}|
| let alphabets = ['a', 'b']| string[]|

#### Tuple

* Tuple is introduced in type script.  

`let tuple: [number, string];`  

Specifies a variable as tuple to have exactly to elements, first is a number and second is a string.

**Note:** `tuple.push()` doesn't throw an error for tuple during compiling, though it violates the length.

#### Enum

* Introduced in typescript.

```ts
enum Status {SUCCESS = 100, FAILURE = 200}
// Can be accessed as Status.SUCCESS
```

#### Union type

```ts
let count: number | string
```

#### Literal type

```ts
let name: 'nikhil' | 'vemula'
```

#### Type aliases

```ts
type custom = number | string
```

#### Function types, function return types and void type

* Funciton types: Fucntion types are types that describe a function.

`addFunction` can be assigned to any function which takes two numbers and returns a number.

```ts
let addFunction: (a: number, b: number) => number;
```

* Return type can be specified to a function

```ts
function add(a: number, b: number): number {
    return a + b;
}
```

* Void return type can be specified for function not returning anything.

```ts
function print(str: any): void {
    console.log(str);
}
```

* Callback function type can be defined similarly

```ts
function addPrintFunction (a: number, b: number, callback: (num:number)=> void)
```

**Note:** callback function can return something even if the function is expecting void.

```ts
function addPrintFunction (a: number, b: number, callback: (num:number)=> void) {
    callback(a+b);
}

addPrintFunction(1, 2, (num)=>{
    console.log(num);
    return num; // No error, though callback is expected to return nothing.
})
```

#### Unknown type

```ts
let idontknow: unknown;
idontknow = 5;
idontknow = 'nick';
let stringValue: string;
stringValue = idontknow; // Error

let anyValue: any;
anyValue = 5;
anyValue = 'nick';
let stringValue: string;
stringValue = anyValue; // No error
```

#### Never type

Function `never` returns a value.

```ts
function throwError: () => never {
    throw new Error();
    // while(true);
}
```

## Compiler options and configuration

* [tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html)
* [Compiler options](https://www.typescriptlang.org/docs/handbook/compiler-options.html)

## OOP

### Classes

```ts
class Bird {
    type: string;
    sound: string;

    constructor(type: string, sound: string) {
        this.type = type;
        this.sound = sound;
    }

    makeSound(this: Bird) {
        console.log(this.sound);
    }
}
```
