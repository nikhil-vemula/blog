---
title: "Bellman Ford"
date: 2020-06-14T23:07:44+05:30
type: post
---

```cpp
/**
* Bellman Ford
*/

#include <iostream>
#include <vector>

using namespace std;

void BellmanFord(WeightedGraph* graph) {
    vector<double> dist(graph->v);
    // Fill the distance array with infinity
    fill(dist.begin(), dist.end(), numeric_limits<double>::infinity());
    dist[0] = 0;
    // For v-1 times relax the edges
    for (int r=0; r < graph->v-1; r++) {
        // For all edges calc the new distance value
        for(int i=0; i < graph->v; i++) {
            for(int j=0; j < graph->v; j++) {
                if (graph->edges[i][j] != 0) {
                    if (dist[i] + graph->edges[i][j] < dist[j]) {
                        dist[j] = dist[i] + graph->edges[i][j];
                    }
                }
            }
        }
        for(double i: dist) {
            cout << i << " ";
        }
        cout << "\n";
    }
    for(double i: dist) {
        cout << i << " ";
    }
    cout << "\n";
}

class WeightedGraph {
    public:
    int v;
    int e;
    vector<vector<int>> edges;

    WeightedGraph(int v, int e) {
        this->v = v;
        this->e = e;
        vector<int> edge = vector<int>(v);
        this->edges = vector<vector<int>>(v, edge);
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
    BellmanFord(graph);
    return 0;
}
```
