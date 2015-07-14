# Building a JSON API wrapper with `Net::HTTP`


## Introduction

We're going to walk through building a simple API wrapper for [jsontest](http://www.jsontest.com). JSON Test is a sample API which is useful for testing API interactions.

There are 4 parts to this workshop:

* Writing a simple API wrapper
* Refactoring the wrapper
* Using metaprogramming to further refactor and simplify
* Using metaprogramming without method missing

We'll be using the following endpoints from JSON Test:

* [IP Address](http://www.jsontest.com/#ip)
* [Date and Time](http://www.jsontest.com/#date)
* [MD5](http://www.jsontest.com/#md5)


## Example Usage

We want to use our API wrapper (client) like so:

```ruby
api = Client.new('jsontest.com')
api.ip # => 8.8.8.8
api.date # => 03-02-2013
api.md5(text: 'testing') # => ae2b1fca515949e5d54fb22b8ed95575
```

And the program should output:

```
IP:
90.216.134.198
Date:
06-18-2015
MD5:
ae2b1fca515949e5d54fb22b8ed95575
```


## Walk-through

_Coding walk-through to be done in person with group._


## Solutions

* [Writing a simple API wrapper](1-basic.rb)
* [Refactoring the wrapper](2-refactored.rb)
* [Using metaprogramming to further refactor and simplify](3-metaprogramming.rb)
* [Using metaprogramming without method missing](4-metaprogramming-without-method-missing.rb)
