# Tutors Guide

The purpose of this guide is to provide information for anyone delivering this learning material to candidates.


## Contents

* [Slack](#slack)
* [Deliverables](#deliverables)
* [Exercises](#exercises)
  * [Blocks and Procs](#blocks-and-procs)
  * [Classes](#classes)
  * [Collections](#collections)
  * [Conditional Statements](#conditional-statements)
  * [Debugging](#debugging)
  * [Modules](#modules)
  * [Rack](#rack)
  * [Rake](#rake)
  * [RSpec](#rspec)
  * [Run Ruby](#run-ruby)
  * [Sinatra](#sinatra)
  * [Strings 1](#strings-1)
  * [Strings 2](#strings-2)
  * [Animal Quiz](#animal-quiz)
* [Workshops](#workshops)
  * [Logical statements](#logical-statements)
  * [Exceptions](#exceptions)
  * [About blocks](#about-blocks)
  * [Building a JSON API wrapper with `Net::HTTP`](#building-a-json-api-wrapper-with-nethttp)
  * [Sinatra Testing with `Rack::Test`](#sinatra-testing-with-racktest)
  * [Domain Specific Language (DSL)](#domain-specific-language-dsl)
  * [Building a Gem](#building-a-gem)
* [Useful Resources](#useful-resources)


## Slack

Slack is our primary communication tool used to check in with the candidates and launch more detailed discussions around exercises and workshops.

We've found this to be very valuable, especially as help given publicly is search-able and bookmark-able for pulling up at a later date.

The original Slack team was named `sky-training`, however there is a larger Sky Slack (`sky`) that could now be used instead.

[Index](#contents)


## Deliverables

GitHub is the central place for candidates to store bootcamp progress. By forking the bootcamp materials we can see from the network graph who's been working on exercises.

It's also a good guide to how well they understand version control and checking in work. Sharing code samples is easy and feedback on specific parts of code is easily given in pull requests.

[Index](#contents)


## Exercises


### Blocks and Procs

_Found in [`exercises/blocks-and-procs`](exercises/blocks-and-procs)._

The aim of this exercise is to introduce candidates to blocks, and how to use them to effectively build more readable code.

The first task focuses on using blocks to re-run a chunk of code until an assertion returns a truthy value.

Expected outcomes:

* The use of a `while` loop to call the block
* Use of `sleep` for the `retry_time` option
* Timecop usage in tests to show understanding of how to control time in a testing scenario

The second task gives a DSL and the expected JSON output. There are a few tripping points in the DSL which don't translate directly to the JSON, these are to try and get the candidates to separate the parsing of the DSL and the presentation (export format). Examples of these stumbling blocks:

* `date` is used as a setter and a getter via the same method
* `from` and `to` are represented differently in the outputted JSON
* `call_charges` is formated inside a nested object in the outputted JSON

Ideally candidates would tackle this exercise using TDD by having a spec setup with the DSL being parsed and comparing the JSON output.

It would be nice to see separate objects for `Statement`, `CallCollection` and `Call`. `instance_eval` plays a heavy role in getting the DSL to function correctly.

[Index](#contents)


### Classes

_Found in [`exercises/classes`](exercises/classes)._

The purpose of this exercise is to expand on the code in [Strings 2](#strings-2). The solution should ideally include some sort of real world modeling of a basket, checkout and price list. For example:

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

As with the previous exercise, the shopping list should use `String#split` to turn both strings into more usable objects to lookup the prices, and `String#scan` to turn the list into a hash.

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

[Index](#contents)


### Collections

_Found in [`exercises/collections`](exercises/collections)._

The aim of this short exercise is to provide candidates time to research the Array API. They should settle on `Array#inject` to sum the total of the shopping list whilst fetching prices from the hash.

Candidates will need to coerce the symbols to strings for the hash lookup, which may catch some of them out.

[Index](#contents)


### Conditional Statements

_Found in [`exercises/conditional-statements`](exercises/conditional-statements)._

This exercise focuses on getting candidates comfortable with navigating the Ruby documentation and discovering loops and manipulation of basic types.

The first task should demonstrate understanding of different looping semantics in Ruby.

The second task should show understanding of `Array` methods.

The third task should show a recursive function building up the Fibonacci sequence (stopping at 100).

Additional points may be gained by demonstrating an understanding of the `and` keyword and the precedence implications that come with it.

[Index](#contents)


### Debugging

_Found in [`exercises/debugging`](exercises/debugging)._

The aim of this exercise is to introduce candidates to debugging in Ruby. Whilst some may be used to interactive debuggers in Java and C#, others may have no experience at all.

During this exercise we introduce `pry`, where the candidates are expected to make liberal use of `binding.pry` to hook into the running program and debug certain aspects of it.

Being quite a primitive exercise, the main aim is to introduce them to the concept of debugging rather than anything related to the actual code in this exercise.

[Index](#contents)


### Modules

_Found in [`exercises/modules`](exercises/modules)._

This exercise is all about refactoring duplicate code by extracting it into respective modules based on their functionality.

Alongside these newly created modules candidates should create shared contexts to reduce duplication in tests.

Candidates can gain additional points by showing they understand how to check when a module has been included using `Module#ancestors`.

[Index](#contents)


### Rack

_Found in [`exercises/rack`](exercises/rack)._

This exercise focuses on building a Sinatra-like framework with string translation built in. This exercise purposely doesn't use an existing framework as it's important candidates understand the underlying implementation of frameworks like Sinatra using Rack to build and debug their own.

Key points to focus on in this exercise:

* Creating a simple DSL to define routes, HTTP verbs and the response body
* Taking the response body and auto-translating it if an extension is appended to the URL (e.g. `/about.en`)
* Implementing a [simple API wrapper](workshops/json-api-wrapper/readme.md) to talk to Bing or Google (although a Google gem exists already)
* Implementing a simple hash-based cache (bonus points for using something like Memcached)
* Fully testing the application in both unit and integration tests (using `Rack::Test`)

Bonus points are awarded for:

* The user following the requirement to ensure translation stays out the way of the user implementing pages (e.g. the user does not need to do anything specific on each page to ensure the content is translatable)
* Using [Nokogiri](http://www.nokogiri.org/) to parse rendered HTML and replace the translated text nodes
* Testing edge cases such as if an extension is not provided (e.g. `/about`)
* Implementing a full Bing API wrapper including authentication

Ideally the final DSL should look something like this:

```ruby
run Linguine.build do

  get('/about') do
    render :about
  end

end
```

[Index](#contents)


### Rake

_Found in [`exercises/rake`](exercises/rake)._

This exercise should test a candidates understanding of Rake through getting them to configure existing Rake scripts and creating their own.

The first two tasks involve setting up `rspec` and `rubocop` to run with various default configurations.

The last task involves creating your own task to create an `ls` style command. Whilst this may be simple to create we've found some candidates struggled during the testing phase of this exercise, mainly around how to invoke tasks programmatically and asserting standard output.

[Index](#contents)


### RSpec

_Found in [`exercises/rspec`](exercises/rspec)._

The purpose of this exercise is to introduce candidates to TDD through a simple rock-paper-scissors application.

The actual logic inside the application is already demonstrated in the video accompanying the exercise. What we're looking for is a clear demonstration of TDD surrounding the application.

Where possible candidates should make use of `context`, `shared_example` and custom matchers to write clear and concise tests covering all aspects of the application.

There should also be competent use of mocking/stubbing surrounding user input and output to the terminal.

[Index](#contents)


### Run Ruby

_Found in [`exercises/run-ruby`](exercises/run-ruby)._

This exercise (paired with [debugging](#debugging)) is meant as an introduction to running Ruby and being comfortable using the command line. Candidates are expected to experiment with the `ruby` and `irb` commands to understand how they work.

Using the `ruby` command candidates should be able to run a file (using `ruby script.rb`), and run some Ruby code inline (using `ruby -e 'puts Time.now'`).

Using the `irb` command they should get comfortable interacting with objects ready for the next exercise (using methods such as `Object#methods`).

[Index](#contents)


### Sinatra

_Found in [`exercises/sinatra`](exercises/sinatra)._

This exercise aims to introduce candidates to Sinatra, which should be especially beneficial considering they've previously written their own framework on top of Rack. Because of this they should feel more comfortable looking at Sinatra's own source code to gain an understanding of how it works.

Candidates should demonstrate an understanding of the two styles of writing Sinatra applications (classic and modular). A modular application should be used for the bill task.

The bill task should demonstrate:

* Use of a templating language such as [`slim`](http://slim-lang.com)
* A separate application to act as an API
* Modelling of the JSON as Ruby objects for consumption in the view (using something like `OpenStruct`)
* A simple authentication helper with some hard coded authentication values (a `username` and `password`)

[Index](#contents)


### Strings 1

_Found in [`exercises/strings-1`](exercises/strings-1)._

The purpose of this exercise is to demonstrate a basic understanding of strings and hashes. The hash is already formatted correctly for fetching item values from, therefore the user just needs to split the string (using `String#split`) and iterate through the values summing the total.

Bonus points may be awarded for the use of `Array#inject` or `Array#map` as well as string formatting methods such as `String#%`.

[Index](#contents)


### Strings 2

_Found in [`exercises/strings-2`](exercises/strings-2)._

The purpose of this exercise is to demonstrate string manipulation methods such as `String#scan` and `String#split`.

As with the previous exercise, the shopping list should use `String#split` to turn both strings into more usable objects to lookup the prices from.

The raw price list should make use of regular expressions and `String#scan` to turn the list into a hash. Such as:

```ruby
matches = string.scan(/(\w+)\s=\s£?([\d.]+)p?/)
```

[Index](#contents)


### Animal Quiz

_Found in [`exercises/animal-quiz`](exercises/animal-quiz)._

The animal quiz was extracted from [Ruby Quiz](http://rubyquiz.com/quiz15.html). This exercise isn't actually a part of the bootcamp specifically but we've been using it as an extension when candidates have rushed through the materials.

There are many ways to solve this quiz (as the Ruby Quiz site proves), but a few common characteristics we've seen in solutions are:

* Separating the terminal output into a UI object (which also helps to stub out the UI during testing)
* Using a loop to walk through the quiz steps
* Normalising user input and modelling it internally using `Question`/`Answer` objects

We've found candidates have gotten stuck on this exercise, specifically around testing the program end-to-end as at first it can be unclear how to test the `puts` and `gets` calls.

Candidates have also become stuck surrounding the application learning from questions and adding that information to an internal database.

[Index](#contents)


## Workshops


### Logical statements

The aim of this short workshop is to introduce candidates to the many different ways to assign and assert variable values.

Key areas to touch on:

* Using an inline `if`/`unless` is usually only done for smaller assertions
* Introduce the `unless` keyword
* Explain precedence related issues with ternary expressions (e.g. `true ? something + 1 : something || other`)
* Explain memoization
* Explain case statements and how they can be used to assert an objects class (using the `===` operator internally)

[Index](#contents)


### Exceptions

The aim of this workshop is to introduce candidates to exceptions, how to rescue from them, and how to use `ensure`.

Key areas to touch on:

* A generic `raise` without an exception class
* The importance of more specific exceptions (don't rescue `Exception` if you know what you're trying to rescue from)
* Multiple rescue statements
* `begin`/`end` syntax and how it's not required when inside a method definition
* Getting stack trace and exception information from a rescue
* Using `ensure`

[Index](#contents)


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

[Index](#contents)


### Building a JSON API wrapper with `Net::HTTP`

The aim of this workshop is to introduce candidates to `Net::HTTP` and some elements of meta programming.

Key areas to touch on:

* Using the `URI` object to construct valid URLs
* Refactoring duplication between the three similar endpoint methods
* Using method missing to automatically call certain URLs on [jsontest.com](http://www.jsontest.com) (also mentioning `Object#respond_to?`)
* Using `define_method` to define supported API methods

[Index](#contents)


### Sinatra Testing with `Rack::Test` and `RSpec`

The aim of this workshop is to introduce candidates to the basics of testing Sinatra with `Rack::Test` and `RSpec`.

Key areas to touch on:

* Sinatra DSL (basic `get`/`post` calls)
* Writing a simple JSON service
* Using `Rack::Test` to `post` data to an endpoint
* Using a shared context to setup the request for testing
* Using `assert` and `last_response`

[Index](#contents)


### Domain Specific Language (DSL)

The aim of this workshop is to introduce candidates to `instance_eval` and basic data modeling in Ruby.

Key areas to touch on:

* Splitting up the DSL into separate objects (`Company`, `Department` and `Employee`)
* Using `instance_eval` and blocks to call methods on object instances
* Using `define_method` to DRY up method definitions for Employee (such as `first_name` and `last_name`)

An additional task is provided for candidates by expanding on the DSL to add a `managing_director` attribute, which can be useful to demonstrate how well they've understood the workshop.

[Index](#contents)


### Building a Gem

The aim of this workshop is to introduce candidates to creating a gem with Bundler and writing a CLI application using TDD.

Key areas to touch on:

* Creating a new gem with `bundle gem todo_manager`
* Introducing candidates to the directory structure
* Explanation of how Bundler requires dependencies (with the `gemspec` keyword in the Gemfile)
* Creating a CLI application using the `./bin` directory and `ARGV`
* Extending the CLI by adding more supported commands
* Adding a help manual
* Adding an "unsupported command" error message
* Using RSpec to test the client

[Index](#contents)


## Useful Resources

* [Ruby Doc](http://ruby-doc.org/)
* [Ruby Weekly](http://rubyweekly.com/issues)
* [Ruby Toolbox](https://www.ruby-toolbox.com/)
* [Ruby Quiz](http://rubyquiz.com/)
* [Why's (Poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/)
* [Learn Ruby the Hard Way](http://ruby.learncodethehardway.org/)
* [Ruby Koans](http://rubykoans.com/)

[Index](#contents)
