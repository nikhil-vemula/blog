---
title: "Mongodb"
date: 2020-07-16T23:42:24+05:30
type: post
---

```bash
brew services start mongodb-community@4.2
brew services stop mongodb-community@4.2
```

[https://www.mongodb.com/blog/post/mongodb-go-driver-tutorial](https://www.mongodb.com/blog/post/mongodb-go-driver-tutorial)

## Introduction

* Collection is a table
* Document is a record

## Creating a connection

```go
// Set client options
clientOptions := options.Client().ApplyURI("mongodb://localhost:27017")

// Connect to MongoDB
client, err := mongo.Connect(context.TODO(), clientOptions)

if err != nil {
    log.Fatal(err)
}

// Check the connection
err = client.Ping(context.TODO(), nil)

if err != nil {
    log.Fatal(err)
}

fmt.Println("Connected to MongoDB!")
```

## Open or create collection

```go
collection := client.Database("test").Collection("trainers")
```

## Inserting one document

```go
ash := Trainer{"Ash", 10, "Pallet Town"}
insertResult, err := collection.InsertOne(context.TODO(), ash)
if err != nil {
    log.Fatal(err)
}
fmt.Println("Inserted a single document: ", insertResult.InsertedID)
```

## Inserting multiple document

```go
misty := Trainer{"Misty", 10, "Cerulean City"}
brock := Trainer{"Brock", 15, "Pewter City"}

trainers := []interface{}{misty, brock}

insertManyResult, err := collection.InsertMany(context.TODO(), trainers)
if err != nil {
    log.Fatal(err)
}

fmt.Println("Inserted multiple documents: ", insertManyResult.InsertedIDs)
```

## Update a document

```go
filter := bson.D{{"name", "Ash"}}
update := bson.D{
    {"$inc", bson.D{
        {"age", 1},
    }},
}
updateResult, err := collection.UpdateOne(context.TODO(), filter, update)
if err != nil {
    log.Fatal(err)
}
fmt.Println("Updated ", updateResult.MatchedCount)
```

## Find one document

```go
var result Trainer

err = collection.FindOne(context.TODO(), filter).Decode(&result)
if err != nil {
    log.Fatal(err)
}

fmt.Println(result)
```

## Find multiple documents

```go
findOptions := options.Find()
	findOptions.SetLimit(2)

	var results []Trainer

	cur, err := collection.Find(context.TODO(), bson.D{{}}, findOptions)

	for cur.Next(context.TODO()) {
		var t Trainer
		err := cur.Decode(&t)
		if err != nil {
			log.Fatal(err)
		}
		results = append(results, t)
	}

	if cur.Err(); err != nil {
		log.Fatal(err)
	}

	cur.Close(context.TODO())

	for _, ptr := range results {
		fmt.Println(ptr)
	}
```

## Delete multiple documents

```go
deleteResult, err := collection.DeleteMany(context.TODO(), bson.D{{}})
if err != nil {
    log.Fatal(err)
}
fmt.Printf("Deleted %v documents in the trainers collection\n", deleteResult.DeletedCount)
```

