#Blocks
Blocks can be really good for writing very reusable fluent code.

## WaitUntil
Sleeps are never good to see in code. Write a library that allow a user to do some intelligent waiting.

Define a module called `Wait` that has an `until` method this method should take a block which the until method will execute until it returns true.
E.g.
```
start_time = Time.now
Wait.until do
  rand(9999) % 2 == 0
end
```

This method should also take some optional arguments
- retry_time - this is the amount of time it should wait before executing the block again
- expire_after - this is the amount of time in seconds that the method should run for before giving up

If `Wait.until` by default should give up after 5 seconds and if it gives up then it should raise a sensible exception. 

Note: When writing tests for your code you might want to check out something like [TimeCop](https://github.com/travisjeffery/timecop)
