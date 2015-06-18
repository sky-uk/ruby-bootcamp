# Modules
##Introduction
As well as being a container for our code, Modules can be used to package and deliver functionality to completely unrealated classes.

Modules writen to be used in this way are called 'Mixins'

##Objectives
- Write a a Mixin
- Practice writing tests for Mixins

##Exercise
In [lib/ruby_bootcamp/exercise_8](./lib/lib/ruby_bootcamp/exercise_8) you will find code for a [person](./lib/lib/ruby_bootcamp/exercise_8/person.rb) and a [robot](./lib/lib/ruby_bootcamp/exercise_8/robot.rb).

You'll note that they have similar capability, but they represent things that are fundamentally different, implying that inheritance may not be the right way to remove the duplication that exists between them.

Create sensible modules and the corresponding tests for them and the person and robot classes.

### Extra credit
See what you can find out about [Shared examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples) in RSpec. 
