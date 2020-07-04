---
title: "Scaling"
date: 2020-06-23T18:08:39+05:30
type: post
draft: true
---

## Scalability

[https://www.youtube.com/watch?v=-W9F__D3oY4](https://www.youtube.com/watch?v=-W9F__D3oY4)

In order to meet the increasing traffic of a website.
We can either consider scaling the website to more users or improve the performance.

## Scaling

### Vertical scaling

Improve or increase the hardware to meet the requirements.

### Horizontal scaling

Multiple similar webservers can be used and a load balancer can be used to redirect the traffic.

#### Using DNS server as load balancer

Using the DNS server to return different ip address in round robin fashion using BIND

Cons

* There is chance that computational intersive load might go to single server alone in round robin
* Computer will not query the DNS server always. It caches it on first call. Then all the consecutive calls
will go to single server.
* Sessions will break.

#### Problem of session and load balancer

* If there are multiple php servers with sessions. Then if the user is roted to different one everytime. Using the load balancer then he might need to login in the server again.
* We can circumvent this by using a shared storage for the session data.

## Performace

### Caching

* We can use PHP caching, to improve the performance.
* Generate a static html from a dynamic ones like craig's list
* MySql cache
* Mem cache

### Mysql

* Using diffent mysql engines for different use cases
* Using master slave topology for redundancy and read query improvement.

### Terms

* Partitioning
* High availability

## Scalability for dummies

### Notes on clones

[https://www.lecloud.net/post/7295452622/scalability-for-dummies-part-1-clones](https://www.lecloud.net/post/7295452622/scalability-for-dummies-part-1-clones)

* Load balancer can be used to serve from multiple server.
* External cache mechanism can be used for user specific sessions and profiles etc.
* Tools like Capistrano can be used to maintain same code base in all the servers.

### Notes on database

[https://www.lecloud.net/post/7994751381/scalability-for-dummies-part-2-database](https://www.lecloud.net/post/7994751381/scalability-for-dummies-part-2-database)

* Take a master slave approach, and beaf up the master but eventually things will slow down.
* Using no joining approach or noSql database and finally things will slow down and you will try to implement cache.

### Notes on cache

[https://www.lecloud.net/post/9246290032/scalability-for-dummies-part-3-cache](https://www.lecloud.net/post/9246290032/scalability-for-dummies-part-3-cache)

* Caching the database queries
* Caching the objects like sessions, fully rendered blog articles.

### Notes on asynchronism

* One way is to make the cake over night for normal requests
* Second way is tell the customer the when it will be available for special requests
