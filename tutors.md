# Tutors Guide

The purpose of this guide is to provide information for anyone delivering this learning material.


## Exercises


### animal_quiz

TODO


### blocks_and_procs

TODO


### classes

TODO


### collections

TODO


### conditional-statements

TODO


### debugging

TODO


### modules

TODO


### rack

TODO


### rake

TODO


### rspec

TODO


### run-ruby

TODO


### sinatra

TODO


### strings1

TODO


### strings2

The purpose of this exercise is to demonstrate understanding and well structured use of objects. The solution should include some sort of real world modeling of a basket, checkout and price list. For example:

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

The raw price list should make use of regular expressions and `String#scan` to turn the list into a hash. An example of this implementation would look something like:

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

TODO


### Exceptions

TODO


### About blocks

TODO


### Building a JSON API wrapper with `Net::HTTP`

TODO


### Sinatra Testing with `Rack::Test`

TODO


### Domain Specific Language (DSL)

TODO
