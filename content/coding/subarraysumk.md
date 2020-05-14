---
title: "Number of sub arrays whose sum is K"
date: 2020-05-14T14:05:54+05:30
draft: true
---
## Intuition

If I can find all the sub arrays and find the sum of sub arrays. Then I count the number of sub arrays whose sum is k.

* All sub arrays
* Sum of sub arrays

## Sub Arrays

* Continuous part of array is called sub array.
* Number of sub arrays for array of length n is n*(n+1)/2

* Example: [1, 2, 3]  
    [1], [2], [3], [1,2], [2,3], [1,2,3]

### Approach 1

```cpp
#include <iostream>
#include <vector>

using namespace std;

int main() {
    vector<int> nums = {1, 2, 3, 4};
    int lengthOfSubArrray = 1;
    int count = 0;
    while (lengthOfSubArrray <= nums.size()) {
        cout << "Sub array of length: " << lengthOfSubArrray << endl;
        for (int i=0; i < nums.size()-lengthOfSubArrray+1; i++) {
            for (int j=0; j < lengthOfSubArrray; j++) {
                cout << nums[i+j] << " ";
            }
            cout << endl;
            count++;
        }
        cout << endl;
        lengthOfSubArrray++;
    }
    cout << "Number of subarrrays: " << count << endl;
}
/*
sum(k=1ton) n*(n-k)*k
*/
```

### Approach 2

This form gives advantage to reuse the sum till previous index.

```cpp
#include <iostream>
#include <vector>

using namespace std;

int main() {
    vector<int> nums = {1, 2, 3, 4};

    for (int i=0; i < nums.size(); i++) {
        // starting position
        for (int j=i; j < nums.size(); j++) {
             // ending position
            for (int k=i; k <=j; k++)
                cout << nums[k] << " ";
            cout << endl;
        }
    }
}
```

### Output

```bash
1
1 2
1 2 3
1 2 3 4
2
2 3
2 3 4
3
3 4
4
```

## Sum of subarrays

```cpp
#include <iostream>
#include <vector>

using namespace std;

int main() {
    vector<int> nums = {1, 2, 3, 4};
    int sum = 0;
    for (int i=0; i < nums.size(); i++) {
        // starting position
        sum = 0;
        for (int j=i; j < nums.size(); j++) {
            // ending position
            // Calculate sum by reusing previous sum
            sum += nums[j];
            cout << "sum: " << sum << endl;
        }
    }
}
```

## Brute force

* Time complexity: O(n^2)
* Space complexity: O(n)

```cpp
#include <iostream>
#include <vector>

using namespace std;

int main() {
    vector<int> nums = {1, 2, 3, 4};
    int k = 3;
    int count = 0;
    int sum = 0;
    for (int i=0; i < nums.size(); i++) {
        // starting position
        sum = 0;
        for (int j=i; j < nums.size(); j++) {
            // ending position
            // Calculate sum by reusing previous sum(pre sum)
            sum += nums[j];
            cout << "sum: " << sum << endl;
            if (sum == k)
                count++;
        }
    }
    cout << "Number of sub arrays whose sum is " << k << ": " << count <<endl;
}
```

## Efficient

Consider [4, 5, 1, 2, 3, 4, 3, 6]  
Manually solving this for sum 9 gives:

```bash
[4, 5],  
[2, 3, 4],  
[3, 6]
```

* The sub arrays [4, 5] can be made directly with array the starting at position 0 with length 2.
* The sub array [2, 3, 4] can be made by removing [4, 5, 1] from [4, 5, 1, 2, 3, 4]. i.e if current_sum exceeds required sum by a number which is sum of sub arrays. Then we can form a array by removing that array.
In above Above. Sum of [4, 5, 1, 2, 3, 4] is 19 and required sum is 9. The current sum 19 exceeds reuiqred sum 9 by 10. which can made using [4, 5, 1].
* Similarily [4, 5, 1, 2, 3, 4, 3, 6] sum 28 exceeds 9 by 18 which is sum of sub array [4, 5, 1, 2, 3, 4]

So, if we can store a sum till current number in map and use it. We can solve the problem in O(n)

Efficient solution at: [https://www.geeksforgeeks.org/number-subarrays-sum-exactly-equal-k/](https://www.geeksforgeeks.org/number-subarrays-sum-exactly-equal-k/)

## References

* [https://www.geeksforgeeks.org/subarraysubstring-vs-subsequence-and-programs-to-generate-them/](https://www.geeksforgeeks.org/subarraysubstring-vs-subsequence-and-programs-to-generate-them/)
* [https://www.geeksforgeeks.org/number-subarrays-sum-exactly-equal-k/](https://www.geeksforgeeks.org/number-subarrays-sum-exactly-equal-k/)