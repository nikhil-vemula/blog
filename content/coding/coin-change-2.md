---
title: "Coin Change 2"
date: 2020-06-07T17:09:24+05:30
type: post
---

## Recursive

```cpp
/**
* Coin change problem
* Number of ways in which a given amound can be made
* using unlimited supply of given coins.
**/

#include <iostream>
#include <vector>

using namespace std;

void printInfo(const vector<int>& coins, int i, int amount);

int count(const vector<int>& coins, int i /*ith coin*/, int amount) {

    printInfo(coins, i, amount);

    if (amount == 0)
        return 1;

    if (amount < 0)
        return 0;

    // No more coins to consider
    if (i >= coins.size())
        return 0;

    // We either build the amount considering the ith coin or not
    // If we dont consider we try to make the amount removing the coin.
    // If we consider the the amount will be reduced.
    // i. dont consider ii. consider
    return count(coins, i+1, amount) + count(coins, i, amount - coins[i]);
}

void printInfo(const vector<int>& coins, int i, int amount) {
    cout << "Trying to make amount " << amount <<  " using coins: ";
    for(int idx = i; idx < coins.size(); idx++) {
        cout << coins[idx] << " ";
    }
    cout << "\n";
}

int main()
{
    vector<int> coins = {1, 2, 5};
    int amount = 5;
    cout << count(coins, 0, 5);
    return 0;
}
```

## Top down

```cpp
/**
* Coin change problem
* Number of ways in which a given amound can be made
* using unlimited supply of given coins.
**/

#include <iostream>
#include <vector>

using namespace std;

void printInfo(const vector<int>& coins, int i, int amount);
bool checkBoundaries(const vector<vector<int>>& mem, int i, int j);

int count(const vector<int>& coins, vector<vector<int>>& mem, int i /*ith coin*/, int amount) {

    printInfo(coins, i, amount);

    if (amount == 0)
        return 1;

    if (amount < 0)
        return 0;

    // No more coins to consider
    if (i >= coins.size())
        return 0;

    // We either build the amount considering the ith coin or not
    // If we dont consider we try to make the amount removing the coin.
    // If we consider the the amount will be reduced.
    // i. dont consider ii. consider

    // Look if subproblem is already solved or not

    int notConsideringIthCoin = 0;
    if(i+1 <= coins.size()) {
        if (mem[i+1][amount] == -1)
            mem[i+1][amount] = count(coins, mem, i+1, amount);
        notConsideringIthCoin = mem[i+1][amount];
    }

    int consideringIthCoin = 0;
    if(amount - coins[i] >= 0) {
        if (mem[i][amount - coins[i]] == -1)
            mem[i][amount - coins[i]] = count(coins, mem, i, amount - coins[i]);
        consideringIthCoin = mem[i][amount - coins[i]];
    }

    return consideringIthCoin + notConsideringIthCoin;
}

bool checkBoundaries(const vector<vector<int>>& mem, int i, int j) {
    // i -> coin_index
    // j -> amount
    // cout << i << " " << j << "\n";
    if(i < 0 || j < 0 || i >= mem.size()|| j >= mem[0].size())
        return false;
    return true;
}

void printInfo(const vector<int>& coins, int i, int amount) {
    cout << "Trying to make amount " << amount <<  " using coins: ";
    for(int idx = i; idx < coins.size(); idx++) {
        cout << coins[idx] << " ";
    }
    cout << "\n";
}

int main()
{
    vector<int> coins = {1, 2, 5};
    int amount = 500;
    vector<int> amountArr(amount+1);
    fill(amountArr.begin(), amountArr.end(), -1);
    vector<vector<int>> mem(coins.size()+1, amountArr);
    cout << count(coins, mem, 0, amount);
    return 0;
}
```
