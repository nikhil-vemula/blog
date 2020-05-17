---
title: "Number of islands"
date: 2020-05-17T20:31:42+05:30
type: post
---
[https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3302/](https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3302/)

```cpp
#include <iostream>
#include <vector>
#include <utility>

using namespace std;

pair<int,int> allVisited(vector<vector<char>>& grid);
void visit(vector<vector<char>>& grid, pair<int,int> p);

int main() {
    vector<vector<char>> grid { 
        {'1','1','0','0','0'},
        {'1','1','0','0','0'},
        {'0','0','1','0','0'},
        {'0','0','0','1','1'}
    };
    int count = 0;
    pair<int,int> p = allVisited(grid);
    while(p.first != -1 || p.second != -1) {
        visit(grid, p);
        count++;
        cout << "next itr" << endl;
        p = allVisited(grid);
    }
    cout << count;
    return 0;
}
pair<int,int> allVisited(vector<vector<char>>& grid) {
    for(int i=0; i<grid.size(); i++) {
        for (int j=0; j<grid[0].size(); j++) {
            if (grid[i][j] == '1') {
                return {i,j};
            }
        }
    }
    return {-1, -1};
}
void visit(vector<vector<char>>& grid, pair<int,int> p){
    if (grid[p.first][p.second] != '1' || grid[p.first][p.second] == '2')
        return;
    cout << "visiting.." << p.first << " " << p.second << endl;
    grid[p.first][p.second] = '2';
    if (p.first-1 >= 0)
        visit(grid, {p.first-1, p.second});
    if (p.second+1 <= grid[0].size() -1)
        visit(grid, {p.first, p.second+1});
    if (p.first+1 <= grid.size() - 1)
        visit(grid, {p.first+1, p.second});
    if (p.second-1 >= 0)
        visit(grid, {p.first, p.second-1});
}
```
