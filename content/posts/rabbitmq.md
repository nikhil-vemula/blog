---
title: "Rabbitmq"
date: 2020-06-25T00:51:22+05:30
type: post
draft: true
---

RabbitMQ is a message broker.

```bash
docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3-management
```

### Ports

* 15672 - http
* 5672 - ampq
