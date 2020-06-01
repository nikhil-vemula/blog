---
title: "CPP STL Reference"
date: 2020-05-12T17:27:58+05:30
type: post
draft: true
---

## Sort

```cpp
#include <iostream>
#include <vector>

using namespace std;

bool f(int a, int b) {
    return a > b;
}

int main()
{
    vector<int> v  = { 18, 17, 13, 19, 15, 11, 20, 12, 33, 25 };

    // Sort the vector
    sort(v.begin(), v.end());

    for(int i: v){
        cout << i << " ";
    }
    cout << "\n";

    // Sort the vector in revere order
    sort(v.begin(), v.end(), f);

    for(int i: v){
        cout << i << " ";
    }
    cout << "\n";

    return 0;
}
```

## Lower and upper bound

```cpp
// lower_bound -> give me iterator >= 100
vector<int>::iterator itr = lower_bound(vect.begin(), vect.end(), 100);
cout << *itr << endl;

// upper_bound -> give me iterator > 100
vector<int>::iterator itr1 = upper_bound(vect.begin(), vect.end(), 100);
cout << *itr1 << endl;

cout << "Count of 100" << itr1 - itr << endl;
```

## Vector

Note: g++ -std=cpp14 filename.cpp

```cpp
#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int> v  = { 18, 17, 13 };

    cout << v.front() << endl;
    cout << v.back() << endl;

    v.pop_back();
    cout << v.back() << endl;
    v.push_back(5);
    cout << v.back() << endl;

    for(int i: v) {
        cout << i << " ";
    }
    cout << "\n";

    return 0;
}
```

## Set

* Set elements are sorted.
* Set duplicate elements are not allowed.

```cpp
#include <iostream>
#include <set>

using namespace std;

int main()
{
    set<int> s;

    s.insert(10);
    cout << "Is Inserted: " << (s.insert(10).second ? "true" : "false") << endl;

    return 0;
}
```

## Map

* Retrive, find, erase take logn time.

```cpp
#include <iostream>
#include <map>

using namespace std;

int main()
{
    map<char, int> m;

    m['a'] = 10;
    m['b'] = 5;

    for(pair<char, int> p: m){
        cout << p.first << ": " << p.second << endl;
    }

    return 0;
}
```

## Max heap

```cpp
#include <iostream>
#include <vector>

using namespace std;

void printHeap(vector<int>& v);

int main()
{
    vector<int> v = {18, 13, 2, 100};

    make_heap(v.begin(), v.end());

    printHeap(v);

    cout << "Max value: " << v.front() << endl;

    // Pop heap
    pop_heap(v.begin(), v.end());
    v.pop_back();

    printHeap(v);

    //Push heap
    v.push_back(50);
    push_heap(v.begin(), v.end());

    printHeap(v);

    return 0;
}

void printHeap(vector<int>& v) {
    for(int i: v) {
        cout << i << " ";
    }
    cout << endl;
}
```

## Priority Queue

```cpp
#include <iostream>
#include <queue>

using namespace std;

void printQueue(priority_queue<int>& g);

int main()
{
    priority_queue<int> q;
    q.push(10);
    q.push(5);
    q.push(20);
    q.push(2);
    printQueue(q);
    return 0;
}

void printQueue(priority_queue<int>& g) {
    while (!g.empty()) {
        cout << g.top() << " ";
        g.pop();
    }
    cout << '\n';
}
```

## References

[https://www.youtube.com/watch?v=g-1Cn3ccwXY](https://www.youtube.com/watch?v=g-1Cn3ccwXY)
