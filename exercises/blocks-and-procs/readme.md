# Blocks and Procs


Blocks can be really good for writing very reusable fluent code.


## `Wait.until`

Sleeps are never good to see in code. Write a library that allow a user to do some intelligent waiting.

Define a module called `Wait` that has an `until` class method. This method should take a block which the until method will execute until it returns true.

For example:

```ruby
start_time = Time.now

Wait.until do
  rand(9999) % 2 == 0
end
```

This method should also take some optional arguments

* `retry_time` - this is the amount of time it should wait before executing the block again
* `expire_after` - this is the amount of time in seconds that the method should run for before giving up

`Wait.until` by default should give up after 5 seconds and should raise a sensible exception if it does so.

_Note: when writing tests for your code you might want to utilise something like [TimeCop](https://github.com/travisjeffery/timecop)._


## Telephone Billing Statement DSL

Write a Domain Specific Language that lets you describe a telephone bill.

The overall `Statement` class should have a to_json method that when you call it renders the following.

```json
{
  "statement": {
    "generated": "2015-01-11",
    "due": "2015-01-25",
    "period": {
      "from": "2015-01-26",
      "to": "2015-02-25"
    },
    "total": 1.23,
    "callCharges": {
      "calls": [
        { "called": "07716393769", "date": "2015-01-26", "duration": "00:23:03", "cost": 1.13 },
        { "called": "07716393769", "date": "2015-01-26", "duration": "00:23:03", "cost": 0.20 }

      ]
    }
  }
}
```

The DSL should make heavy use of blocks. For example:

```ruby
statement = Statement.new do
  date Date.today
  due(date + 30.days)
  from Date.parse('2015-01-26')
  to Date.parse('2015-02-25')

  call_charges do
    call '07716393769' do
      date Date.parse('2015-02-01')
      duration "00:23:03"
      cost 1.13
    end
  end
end
```

The exact form the DSL is of course entirely up to you. See what you can do! P.S. don't forget to the write the tests!
