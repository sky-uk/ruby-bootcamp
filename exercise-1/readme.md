# Run Ruby


## Introduction

On a daily basis you will most likely use your IDE to run code for you. Before we get to that however it’s important to know what’s behind the magic and learn to run your own code.

Objectives:

- Discover the ‘ruby’ command
- Discover the ‘irb’ command


## Exercise


### Use the ‘ruby’ command

Run: ruby -h to find out the different options that the ruby command supports

1. run the runme.rb file that is under ~/Projects/ruby-bootcamp/exercise-1
2. run the same file use the option specifying the option that allows you to change the current directory.
3. work out how to run the following line of ruby without putting it into a file: `puts “hello world”`


### The Interactive Ruby Shell (irb)

IRB lets you run any commands you would run within your code in an interactive shell. This is very useful when you are trying to prototype something in particular.

Use irb to run some of the statements in [runme.rb](./runme.rb)

1. What sort of object do you get when you run Time.now. (Use the .class method to find out)
2. What other methods does that returned object have on it? (use the .public_methods method to find out, e.g. Time.now.public_methods)
3. Use the Time RDoc to find out what extras you get.
