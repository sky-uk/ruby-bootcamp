# Run Ruby


## Introduction

On a daily basis you will most likely use your IDE to run code for you. Before we get to that however it's important to know how to run your own code manually.


## Objectives

* Discover the `ruby` command
* Discover the `irb` command


## Exercise


### Use the `ruby` command

Run: `ruby -h` to find out the different options that the ruby command supports.

* Run the [`runme.rb`](runme.rb) file
* Run the same file use the option specifying the option that allows you to change the current directory
* Work out how to run the following line of ruby without putting it into a file: `puts "Hello world"`


### Use the `irb` (interactive Ruby) command

IRB lets you run any commands you would run within your code in an interactive shell. This is very useful when you are trying to prototype something in particular.

Use `irb` to run some of the statements in [runme.rb](runme.rb):

* What sort of object do you get when you run `Time.now`. (Use the `.class` method to find out)
* What other methods does that returned object have on it? (use the `.public_methods` method to find out, e.g. `Time.now.public_methods`)
* Use the Time RDoc to find out what extras you get
