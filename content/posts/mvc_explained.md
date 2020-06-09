---
title: "MVC"
date: 2020-06-07T17:09:24+05:30
type: post
---

By Example, consider a Address book application to display list of users and their phone numbers. MVC helps in reusing the model if the view changes from list to gird. It also helps to reuse view of not only to display person information later on. It avoids coupling of data and the view.

* MVC is a architectural pattern.
* MVC stands for model, view and controller.

## Model

* Model deals with data related logic.
* Model represents the data. Example: PersonModel which has picture and phone_number.

>**The model represents the data, and does nothing else. The model does NOT depend on the controller or the view.**

>**MVC makes model classes reusable without modification.**

## View

* View deals with UI related stuff.
* Dynamic data can be achieved in view by using template engines.

>**MVC can also make the view reusable without modification.**

## Controller

* Controller acts as an interface between the model and view.
* Controller get data from model.
* Controller renders the data to view.

### References

* [https://www.tomdalling.com/blog/software-design/model-view-controller-explained/](https://www.tomdalling.com/blog/software-design/model-view-controller-explained/)