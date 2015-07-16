# About Blocks


## Introduction

Blocks, procs and lambdas (also known as closures in other languages) are one of the most powerful constructs in Ruby. There are a variety of different ways to create and use blocks, which this workshop aims to clarify.


## Walk-through

_Coding walk-through to be done in person with group._


## Solutions

* [Implicit blocks](1-implicit-block.rb)
* [Block arguments](2-block-arguments.rb)
* [Multiple yields](3-multiple-yields.rb)
* [Block presence](4-block-presence.rb)
* [Block scopes](5-block-scopes.rb)
* [Block objects](6-block-objects.rb)
* [Explicit blocks](7-explicit-block.rb)
* [Return values](8-return-values.rb)


## Notes

* Procs are objects, blocks are not
* Blocks are part of the syntax of a method call
* Both `proc` and `lambda` return Proc objects
* Lambdas assert arity (number of passed arguments)
* Return inside a lamba returns flow to the outer code scope
* Return inside a proc is executed in the outer scope (as if inside that scope directly)
