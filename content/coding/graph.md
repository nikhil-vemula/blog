---
title: "Graph"
date: 2020-06-14T20:55:17+05:30
type: post
---

```cpp
/**
* Weighted graph using adjacency matrix
*/

#include <iostream>
#include <vector>

using namespace std;
class WeightedGraph {
    public:
    int v;
    int e;
    vector<vector<int>> edges;

    WeightedGraph(int v, int e) {
        this->v = v;
        this->e = e;
        this->edges = vector<vector<int>>(v, vector<int>(v));
    }

    void addEdge(int u, int v, int w) {
        edges[u-1][v-1] = w;
    }

    void print() {
        for (int i=0; i < v; i++) {
            for (int j=0; j < v; j++) {
                cout << edges[i][j] << " ";
            }
            cout << "\n";
        }
    }
};

int main()
{
    WeightedGraph *graph = new WeightedGraph(7, 10);
    graph->addEdge(1, 2, 6);
    graph->addEdge(1, 3, 5);
    graph->addEdge(1, 4, 5);
    graph->addEdge(3, 2, -2);
    graph->addEdge(4, 3, -2);
    graph->addEdge(2, 5, -1);
    graph->addEdge(3, 5, 1);
    graph->addEdge(4, 6, -1);
    graph->addEdge(5, 7, 3);
    graph->addEdge(6, 7, 3);
    graph->print();
    return 0;
}
```
