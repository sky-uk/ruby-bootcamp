# Modules
##Introduction
As well as being a container for our code, Modules can be used to package and deliver functionality to completely unrealated classes.

Modules writen to be used in this way are called 'Mixins'

##Objectives
- Write a Module as a Mixin
- Practice writing tests for Mixins

##Exercise
Using the code supplied in [messaging.rb](./lib/messaging.rb). Implement a module that can be used to output messages:
required methods:
- info(message) # return String, format = Info: [message]
- warn(message) # return String, format = Warn: [message]
- error(message) # return String, format = Error: [message]

### Extra credit
See what you can find out about [Shared examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples) in RSpec. Is there a way to use them and reduce any duplication in your test?
