# Sinatra

So we've looked at Rack and even written our own framework. Now it's time to use someone else's. [Sinatra](http://www.sinatrarb.com/) is a really nice framework that has a great DSL for defining both services and sites.


## Classic and Modular applications

There are two types of Sinatra application. Classic and [Modular](http://www.sinatrarb.com/intro.html#Sinatra::Base%20-%20Middleware,%20Libraries,%20and%20Modular%20Apps).


### Classic

```ruby
require 'sinatra'

get '/' do
  'hello world'
end
```


### Modular

```ruby
require 'sinatra'

class App < Sinatra::Base

  get '/' do
    'hello'
  end

end

run App
```


## Exercises

Objectives:

* Get to grips with writing Modular Sinatra applications
* Test them throughly using Rack::Test etc...
* Implement Rakefiles for your projects


### Task 1: View my Bill

Some things are not meant to be seen by everyone and your billing information is a good example.

Write an application that has a login in screen that will only let you see your bill if you have the right user name and password.

_Note: the purpose of the exercise is to have a play with Sinatra so the username and password can be hard coded._

Once you are logged in, read in the the [JSON from the supplied file](bill.json) and render it using a [view templating engine](http://www.sinatrarb.com/intro.html#Views%20/%20Templates) of your choice.


### Task 2: Bill Service

The bill data needs to come from some where and files are _so yesterday_. Write a service using Sinatra to serve the JSON that you used in the previous task.

Once you've done this call this services from within you bill application.
