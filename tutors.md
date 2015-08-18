# Tutors Guide

The purpose of this guide is to provide information for anyone delivering this learning material.


## Contents

* [Slack](#slack)
* [Deliverables](#deliverables)
* [Exercises](#exercises)
  * [blocks_and_procs](#blocks_and_procs)
  * [classes](#classes)
  * [collections](#collections)
  * [conditional-statements](#conditional-statements)
  * [debugging](#debugging)
  * [modules](#modules)
  * [rack](#rack)
  * [rake](#rake)
  * [rspec](#rspec)
  * [run-ruby](#run-ruby)
  * [sinatra](#sinatra)
  * [strings1](#strings1)
  * [strings2](#strings2)
  * [animal_quiz](#animal_quiz)
* [Workshops](#workshops)
  * [Logical statements](#logical-statements)
  * [Exceptions](#exceptions)
  * [About blocks](#about-blocks)
  * [Building a JSON API wrapper with `Net::HTTP`](#building-a-json-api-wrapper-with-nethttp)
  * [Sinatra Testing with `Rack::Test`](#sinatra-testing-with-racktest)
  * [Domain Specific Language (DSL)](#domain-specific-language-dsl)
* [Useful Resources](#useful-resources)


## Slack

During the original bootcamp we used Slack to check in with the candidates and launch more detailed discussions around exercises and workshops.

We've found this to be very valuable, especially as help given publicly is search-able and bookmark-able for pulling up at a later date.

The original Slack team was named `sky-training`, however there is a larger Sky Slack (`sky`) that can now be used instead.


## Deliverables

We've been using GitHub as a central place for candidates to store bootcamp progress. By forking the bootcamp materials we can see from the network graph who's been working on exercises.

It's also a good guide to how well they understand version control and checking in work. Sharing code samples is easy and feedback on specific parts of code is easily given in pull requests.


## Exercises


### blocks_and_procs

The aim of this exercise is to introduce candidates to blocks, and how to use them to effectively build more readable code.

The first task focuses on using blocks to rerun a chunk of code until an assertion returns a truthy value.

Expected outcomes:

* The use of a `while` loop to run the block
* Use of `sleep` for the `retry_time` option
* Timecop usage in tests to show understanding of how to control time in a testing scenario

The second task gives a DSL and the expected JSON output. There are a few tripping points in the DSL which don't translate directly to the JSON, these are to try and get the candidates to separate the parsing of the DSL and the presentation (export format) of the DSL. Examples of these stumbling blocks:

* `date` is used as a setter and a getter via the same method
* `from` and `to` are represented differently in the outputted JSON
* `call_charges` is formated inside a nested object in the outputted JSON

Ideally candidates would tackle this exercise TDD by having a spec setup with the DSL being parsed and comparing the JSON output.

It would be nice to see separate objects for `Statement`, `CallCollection` and `Call`. `instance_eval` will play a heavy role in getting the DSL to function correctly.


### classes

The purpose of this exercise is to expand on the code in [strings2](#strings2). Ideally the solution should include some sort of real world modeling of a basket, checkout and price list. For example:

```ruby
catalog = Catalog.new(raw_price_list)
basket = Basket.new(raw_shopping_list)
checkout = Checkout.new(catalog, basket)
checkout.process
```

The end string that is outputted may be handled by another object or just printed directly, similar to:

```ruby
puts "The price of the shopping list is: £%.2f" % (checkout.total.to_f / 100)
```

As with the previous exercise, the shopping list should use `String#split` to turn both strings into more usable objects to lookup the prices from and `String#scan` to turn the list into a hash.

For example:

```ruby
class Catalog
  PARSE_REGEX = /(\w+)\s=\s£?([\d.]+)p?/

  def initialize(raw_prices)
    @prices = parse(raw_prices)
  end

  def parse(raw)
    matches = raw.scan(PARSE_REGEX)
    matches.inject({}) do |buffer, match|
      buffer.tap do |hash|
        name = match[0]
        price = coerce_price(match[1])
        hash[name] = price
      end
    end
  end

  def lookup(name)
    @prices[name]
  end

private

  def coerce_price(raw)
    price = raw.include?('.') ? (raw.to_f * 100) : raw
    price.to_i
  end
end

catalog = Catalog.new(price_list)
catalog.lookup('orange') # => 10
```


### collections

The aim of this short exercise is to allow candidates time to research the Array API. Ideally they will settle on `Array#inject` to sum the total of the shopping list whilst fetching prices from the hash.

Candidates will need to coerce the symbols to strings for the hash lookup, which may catch some out.


### conditional-statements

```
TODO
```


### debugging

The aim of this exercise is to introduce candidates to debugging in Ruby. Whilst some may be used to interactive debuggers in Java and C# others may have no experience at all.

During this exercise we introduce `pry`, where the candidates are expected to make liberal use of `binding.pry` to hook into the running program and debug certain aspects of it.

Being quite a primitive exercise, the main aim of this is to introduce them to the concept of debugging rather than anything too specific.


### modules

This exercise is all about refactoring duplicate code by extracting it into respective modules based on their functionality.

Alongside these newly created modules candidates should create shared contexts to reduce duplication in tests.

Candidates can gain additional points by showing they understand how to check when a module has been included (using `Module#ancestors`).


### rack

```
TODO
```


### rake

This exercise should test a candidates understanding of Rake, through getting them to configure existing Rake scripts and creating their own.

The first two tasks involve setting up `rspec` and `rubocop` to run with various default configurations.

The last task involves creating your own task to create an `li` style command. Whilst this may be simple to create we've found candidates struggled during the testing phase of this exercise, mainly around how to invoke tasks programmatically in specs.


### rspec

```
TODO
```


### run-ruby

This exercise (paired with [debugging](#debugging)) is meant as an introduction to running Ruby and being comfortable interacting with it.

Candidates are expected to experiment with the `ruby` and `irb` commands to understand how they work.

Using the `ruby` command candidates should be able to run a file (using `ruby script.rb`), and run some Ruby code inline (using `ruby -e 'puts Time.now'`).

Using the `irb` command they should get comfortable interacting with objects ready for the next exercise.


### sinatra

```
TODO
```


### strings1

The purpose of this exercise is to demonstrate a basic understanding of strings and hashes. The hash is already formatted correctly for fetching item values from, therefore the user just needs to split the string (using `String#split`) and iterate through the values summing the total.

Bonus points may be awarded for the use of `Array#inject` or `Array#map` as well as string formatting methods such as `String#%`.


### strings2

The purpose of this exercise is to demonstrate string manipulation methods such as `String#scan` and `String#split`.

As with the previous exercise, the shopping list should use `String#split` to turn both strings into more usable objects to lookup the prices from.

The raw price list should make use of regular expressions and `String#scan` to turn the list into a hash. Such as:

```ruby
matches = string.scan(/(\w+)\s=\s£?([\d.]+)p?/)
```


### animal_quiz

The animal quiz was extracted from [Ruby Quiz](http://rubyquiz.com/quiz15.html). This exercise isn't actually a part of the bootcamp specifically but we've been using it as an extension when candidates have rushed through the materials.

There are many ways to solve this quiz (as the Ruby Quiz site proves), but a few common characteristics we've seen in solutions are:

* Separating the terminal output into a UI object (which also helps to stub out the UI during testing)
* Using a loop to walk through the quiz steps
* Normalising user input and modelling it internally using question/answer objects

We've found candidates have gotten stuck on this exercise, specifically around testing the program end-to-end as at first it can be unclear how to test the `puts` and `gets` calls.


## Workshops


### Logical statements

The aim of this short workshop is to introduce candidates to the many different ways to assign and assert variable values.

Key areas to touch on:

* Using an inline `if`/`unless` usually only done for small assertions
* Explain precedence related issues with ternary expressions (e.g. `true ? something + 1 : something || other`)
* Explain memoization
* Introduce the `unless` keyword
* Explain case statements and how they can be used to assert an objects class


### Exceptions

The aim of this workshop is to introduce candidates to exceptions, how to rescue from them, and how to use `ensure`.

Key areas to touch on:

* A generic `raise` without an exception class
* The importance of more specific exceptions (don't rescue `Exception` if you know what you're trying to rescue from)
* Multiple rescue statements
* `begin`/`end` syntax and how you don't need it when inside a method definition
* Getting stack trace and exception information from a rescue
* Using `ensure`


### About blocks

The aim of this workshop is to introduce candidates to Ruby's block syntax (via both the `yield` keyword and explicit procs and lambdas).

Key areas to touch on:

* Implicit blocks
* Explicit blocks
* `block_given?`
* Procs are objects, blocks are part of Ruby's syntax
* Blocks are part of the syntax of a method call
* Both `proc` and `lambda` return Proc objects
* Lambdas assert arity (number of passed arguments)
* Return inside a lamba returns flow to the outer code scope
* Return inside a proc is executed in the outer scope (as if inside that scope directly)


### Building a JSON API wrapper with `Net::HTTP`

The aim of this workshop is to introduce candidates to `Net::HTTP` and some elements of meta programming.

Key areas to touch on:

* Using the `URI` object to construct valid URLs
* Refactoring duplication between the three similar endpoint methods
* Using method missing to automatically call certain URLs on jsontest.com
* Using `define_method` to define supported API methods


### Sinatra Testing with `Rack::Test`

The aim of this workshop is to introduce candidates to the basics of testing Sinatra with `Rack::Test`.

Key areas to touch on:

* Sinatra DSL (basic `get`/`post` calls)
* Writing a simple JSON service
* Using rack test to `post` data to an endpoint
* Using `assert` and `last_response`


### Domain Specific Language (DSL)

The aim of this workshop is to introduce candidates to `instance_eval` and basic data modeling in Ruby.

Key areas to touch on:

* Splitting up the DSL into separate objects (`Company`, `Department` and `Employee`)
* Using `instance_eval` and blocks to call methods on object instances
* Using `define_method` to DRY up method definitions for Employee (such as `first_name` and `last_name`)
* Expanding on the DSL to add a `managing_director` attribute (this may be used as an extension for candidates to do after the workshop)


## Useful Resources

* [Ruby Doc](http://ruby-doc.org/)
* [Ruby Weekly](http://rubyweekly.com/issues)
* [Ruby Toolbox](https://www.ruby-toolbox.com/)
* [Ruby Quiz](http://rubyquiz.com/)
* [Why's (Poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/)
* [Learn Ruby the Hard Way](http://ruby.learncodethehardway.org/)
* [Ruby Koans](http://rubykoans.com/)
