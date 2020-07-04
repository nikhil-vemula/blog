---
title: "Block Chain"
date: 2020-06-02T15:59:53+05:30
type: post
draft: true
---

List of blocks linked using  cryptograrphy.

SHA256 - hashing algorithm.

5 Requirements for hashing algorithm to be used.

* One-way
* Determistic
* Fast computation
* The Avalanche effect
* Must withstand collisions

## Immutable ledger

## Distributed P2P Network

## Byzantine fault tolerance

## Consensus protocols

[https://www.coindesk.com/short-guide-blockchain-consensus-protocols](https://www.coindesk.com/short-guide-blockchain-consensus-protocols)

* Attackers challenge
* Competing challenge

### Types

Proof of work (PoW)

* They work to find the golden nounce (cryptographic puzzle) to get the fee associated with the transaction
* Every single node does a series of checks on the new block and rejects if found malicious
* If when two valid block from different sources come, then the chain wait for next block. The chain containing the next block is selected.

Proof of stake (PoS)

## Bit coin

Layers:

* Technology
* Protocol
  * Authentication
  * Update to protocol
* Token

Participants

* Nodes
* Miners
* Large mines
* Mining pools

### Bit coin monetary policy

#### The Halving

* Number of bit coins released into the system is halved every 210000 blocks.
* 21 million coins will be released into system by 2140.
* While mined coins are halved, it might be compensated by the transaction fee.

#### Block frequency

Block is created approximately every 10 mins.

### Mining difficulty

* The mining difficulty is adjusted every 2016 blocks (2 weeks)
* Mining difficulty = current_target / max_target
* If the 2016 blocks are mined faster than 2 weeks the mining difficulty is increased and vice versa.

### How miners select their transactions

* Select the transaction based on the transaction free.
* If a given set of transactions failed to find the golden hash along with time stamp. They need to wait for next second. Instead they chose some other set of transactions in the mean while to not to waste the hashing power.
