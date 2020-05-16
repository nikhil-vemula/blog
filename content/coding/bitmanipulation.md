---
title: "Bit Manipulation"
date: 2020-05-16T14:03:07+05:30
type: post
---

## isPowerOfTwo

```cpp
return n && !(n & n-1)
```

## Count number of ones

```cpp
int count_one (int n){
    while( n ) {
        n = n&(n-1);
        count++;
    }
    return count;
}
```

## ith bit set or not

```cpp
return (n & (1<<i)) ? true : false;
```

## Xor 1 to n

```cpp
switch(n) {
    case n%4 == 0: return n;
    case n%4 == 1: return 1;
    case n%4 == 2: return n+1;
    case n%4 == 3: return 0;
}
```

## References

* [https://www.hackerearth.com/practice/basic-programming/bit-manipulation/basics-of-bit-manipulation/tutorial/](https://www.hackerearth.com/practice/basic-programming/bit-manipulation/basics-of-bit-manipulation/tutorial/)

* [https://www.geeksforgeeks.org/bits-manipulation-important-tactics/](https://www.geeksforgeeks.org/bits-manipulation-important-tactics/)