---
title: "Segment Tree"
date: 2020-05-31T11:16:11+05:30
draft: true
---

## References

```cp
#include <iostream>
#include <vector>

using namespace std;

class SegmentTree {
    private:
    vector<int> tree;
    public:
    SegmentTree(vector<int>& arr) {
        cout << "Building a segment tree..." << "\n";
        this->tree = vector<int>(4 * arr.size());
        this->buildSegTree(arr, 0, 0, arr.size()-1);
    }
    void buildSegTree(vector<int>& arr, int index, int low, int high) {
        // It is leaf node
        if (low == high) {
            this->tree[index] = arr[low];
            return;
        }
        int mid = low + (high - low) / 2;
        buildSegTree(arr, 2*index + 1, low, mid);
        buildSegTree(arr, 2*index + 2, mid+1, high);
        this->tree[index] = merge(this->tree[2*index + 1], this->tree[2*index + 2]);
    }

    int querySegTree(int index, int low, int high, int i, int j) {
        // If segment is outside
        if (j < low || high < i)
            return 0;

        // If segment is completely inside
        if (i <= low && j>=high)
            return this->tree[index];

        // If segment is overlapping

        int mid = low + (high - low) / 2;

        if (i > mid)
            return querySegTree(2*index + 2, mid+1, high, i, j);
        else if (j <= mid)
            return querySegTree(2*index + 1, low, mid, i, j);

        int leftQuery =  querySegTree(2*index + 1, low, mid, i, j);
        int rightQuery =  querySegTree(2*index + 2, mid+1, high, i, j);

        return merge(leftQuery, rightQuery);
    }

    void updateSegTree(int index, int low, int high, int i, int val) {
        if (low == high){
            this->tree[index] = val;
            return;
        }

        int mid = low + (high - low) / 2;

        if (i > mid)
            updateSegTree(2*index + 2, mid+1, high, i, val);
        else if(i <= mid)
            updateSegTree(2*index + 1, low, mid, i, val);

        this->tree[index] = merge(this->tree[2*index+1], this->tree[2*index+2]);
    }

    int merge(int a, int b) {
        // This can be a simple addition or min or max
        // based on the problem
        return a + b;
    }

    void printTree() {
        for(int i: this->tree) {
            cout << i << " ";
        }
        cout << "\n";
    }
};

int main()
{
    vector<int> arr  = { 18, 17, 13, 19, 15, 11, 20, 12, 33, 25 };
    SegmentTree* seg = new SegmentTree(arr);
    seg->printTree();
    seg->updateSegTree(0, 0, arr.size()-1, 0, 2);
    seg->printTree();
    cout << "Query:" << seg->querySegTree(0, 0, arr.size()-1, 5, 9) << "\n";
    return 0;
}
```

[https://www.youtube.com/watch?v=a9WoSN2tN8o](https://www.youtube.com/watch?v=a9WoSN2tN8o)

[https://leetcode.com/articles/a-recursive-approach-to-segment-trees-range-sum-queries-lazy-propagation/](https://leetcode.com/articles/a-recursive-approach-to-segment-trees-range-sum-queries-lazy-propagation/)

[https://stackoverflow.com/questions/28470692/how-is-the-memory-of-the-array-of-segment-tree-2-2-ceillogn-1](https://stackoverflow.com/questions/28470692/how-is-the-memory-of-the-array-of-segment-tree-2-2-ceillogn-1)
