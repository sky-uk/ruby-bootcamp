# Modules


## Introduction

As well as being a container for our code, Modules can be used to package and deliver functionality to completely unrelated classes.

Modules writen to be used in this way are called 'Mixins'.


## Objectives

- Write a a Mixin
- Practice writing tests for Mixins


## Exercise

In this folder you will find code for [Person](lib/exercise-9/person.rb) and [Robot](lib/exercise-9/robot.rb).

You'll note that they have similar capability, but they represent things that are fundamentally different. This means that inheritance may not be the right way to remove the duplication that exists between them.

Create sensible modules and the corresponding tests for them and the person and robot classes.


## Extra credit

- Find an efficient way to check that the module is in use
- Both Person and Robot behave like walking talking things. Maybe shared examples could bring some benefit here? [Shared examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples).
