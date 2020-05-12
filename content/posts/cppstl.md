---
title: "CPP STL"
date: 2020-05-12T17:27:58+05:30
type: post
draft: true
---

## Vector

Note: g++ -st=cpp14 filename.cpp

```cpp
#include <iostream>
#include <vector>

using namespace std;

void printVector(vector<int> vect);

bool f(int x, int y) {
    return x > y;
}

int main() {
    vector<int> vect = { 11, 3, 2, 14 };
    printVector(vect);

    sort(vect.begin(), vect.end()); // Sort using nlogn  
    printVector(vect);

    bool present = binary_search(vect.begin(), vect.end(), 3);
    cout << present <<endl;

    vect.push_back(100);
    vect.push_back(100);
    vect.push_back(100);
    vect.push_back(123);
    printVector(vect);

    // lower_bound -> give me iterator >= 100
    vector<int>::iterator itr = lower_bound(vect.begin(), vect.end(), 100);
    cout << *itr << endl;

    // upper_bound -> give me iterator > 100
    vector<int>::iterator itr1 = upper_bound(vect.begin(), vect.end(), 100);
    cout << *itr1 << endl;

    cout << "Count of 100" << itr1 - itr << endl;

    // Sort in reverse order
    sort(vect.begin(), vect.end(), f);
    printVector(vect);

    // Iterate with reference
    for (int &x: vect) {
        cout << x << " ";
    }
    cout << endl;

    return 0;
}

void printVector(vector<int> vect) {
    for (int i: vect)
            cout << i << " ";
    cout << endl;
}
```

## Set

* Set elements are sorted.

```cpp
#include <iostream>
#include <set>

using namespace std;

void printSet(set<int> se);

int main() {
    set<int> s;

    // Insert: logn
    s.insert(1); 
    s.insert(-2);
    s.insert(10);
    printSet(s);

    auto itr = s.find(-1);
    if (itr == s.end())
        cout << "not present" << endl;
    else
        cout << *itr << endl;

    // >=
    auto itr1 = s.lower_bound(10);
    if (itr1!= s.end())
        cout << *itr1 << endl;
    // >
    auto itr2 = s.upper_bound(10);
    if (itr2 != s.end())
        cout << *itr2 << endl;

    return 0;
}

void printSet(set<int> se) {
    for(int i: se) {
        cout << i << " ";
    }
    cout << endl;
}
```

## References

[https://www.youtube.com/watch?v=g-1Cn3ccwXY](https://www.youtube.com/watch?v=g-1Cn3ccwXY)
