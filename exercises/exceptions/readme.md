# Exceptions


## Introduction

In this exercise you are going to write some exception handling code.

## Exercise

**_Note:_** You'll notice that there arn't any tests right now... Write them in order to add the new functionality required in the exercises that follow

### 1. Raise an exception
in [lib/cat.rb]('cat.rb') you'll find the `Cat` class. The constructor on this class requires you to set the age and name of the cat. However, this constructor could be more helpful than it is right now. Currently `Cat#initialize` will allow you to pass an age the is less than 0. This doesn't make much sense when thinking about cats and what's worse the `Cat#print_age_in_human_years` method just doesn't make sense when a negative age is used.

```RUBY
kitty = Cat.new(age: -1, name: 'billy')
kitty.print_age_in_human_years #=> "I'm -4 human years old"
```

### 2. Raise a specific Exception
Raising specific exceptions gives the user of your api the chance to make a choice about how they handle it.

Modify the code in the constructor to raise an ArguementError and a helpful message if the age specified is less than 0. 

```RUBY
kitty = Cat.new(age: -1, name: 'billy') #=> ArgumentError"
```

### 3. Raise a Custom Error
Having custom exception types can be exceptionally useful (excuse the pun).

Define the method `Cat#learn_new_trick` that provides the signature utilised in the example below. If the cat is older than 100 in human years, throw a custom exception `ToBusySleepingError`

```RUBY
billy = Cat.new(name: 'billy', age: 2)
billy.learn_new_trick(:answer_the_phone) do |args|
  #code that performs the trick
end

billy.tricks #=> [:answer_the_phone]

bob = Cat.new(name: 'bob', age: 35)
bob.learn_new_trick(:answer_the_phone) #> Raises ToBusySleepingError
``` 

### 4. Catch an Error
The cats built using the`Cat` are pretty clever. They know how to divide numbers! Problem is they don't know what to do when the second of those numbers is 0... Enhance the code for the skill to catch the divide by 0 error when if it happens and return nil instead.

```RUBY
billy = Cat.new(name: 'billy', age: 2)
billy.do_trick(:divide, 5,0) # => should return 0
```