# Modules


## Introduction

As well as being a container for our code, modules can be used to package and deliver functionality to completely unrelated classes.

Modules written to be used in this way are called 'Mixins'.


## Objectives

- Write a a Mixin
- Practice writing tests for Mixins


## Exercise

In this folder you will find code for [`Person`](lib/ruby_bootcamp/modules/person.rb) and [`Robot`](lib/ruby_bootcamp/modules/robot.rb).

You'll note that they have similar capabilities, but they represent things that are fundamentally different. This means that inheritance may not be the right way to remove the duplication that exists between them.

Create sensible modules and the corresponding tests for them and the person and robot classes.


## Extension

* Find an efficient way to check that the module is in use
* Both `Person` and `Robot` behave like walking talking things. Maybe [shared examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples) could bring some benefit here?
