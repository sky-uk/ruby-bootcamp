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


## Slack

During the original bootcamp we used Slack to check in with the candidates and launch more detailed discussions around exercises and workshops.

We've found this to be very valuable, especially as help given publicly is search-able and bookmark-able for pulling up at a later date.

The original Slack team was named `sky-training`, however there is a larger Sky Slack that can now be used instead.


## Deliverables

We've been using GitHub as a central place for candidates to store bootcamp progress. By forking the bootcamp materials we can see from the network graph who's been working on exercises.

It's also a good guide to how well they understand version control and checking in work. Sharing code samples is easy and feedback on specific parts of code is easily given in pull requests.


## Exercises


### blocks_and_procs

```
TODO
```


### classes

```
TODO
```


### collections

```
TODO
```


### conditional-statements

```
TODO
```


### debugging

```
TODO
```


### modules

```
TODO
```


### rack

```
TODO
```


### rake

```
TODO
```


### rspec

```
TODO
```


### run-ruby

```
TODO
```


### sinatra

```
TODO
```


### strings1

```
TODO
```


### animal_quiz

```
TODO
```


### strings2

The purpose of this exercise is to demonstrate string manipulation methods such as `String#scan` and `String#split`. For extra points the solution should include some sort of real world modeling of a basket, checkout and price list. For example:

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

As with the previous exercise, the shopping list should use `String#split` to turn both strings into more usable objects to lookup the prices from.

The raw price list should make use of regular expressions and `String#scan` to turn the list into a hash. Such as:

```ruby
matches = string.scan(/(\w+)\s=\s£?([\d.]+)p?/)
```

A more complete example of this (making use of objects) could look something like:

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
```


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
