# Domain Specific Language (DSL)


## Introduction

In this workshop we're going to build a DSL (domain specific language) to parse the employee hierarchy of a company. Using a top level `company` method we're going to define the data, then use the same method to output that information to the console.


## Example Usage

The DSL for defining the data will look like this:

```ruby
company do

  department 'Development' do

    employee do
      first_name 'Josh'
      last_name 'Nesbitt'
      role 'Software Engineer'
    end

    employee do
      first_name 'Leon'
      last_name 'Davis'
      role 'Software Engineer'
    end

  end

  department 'Management' do

    employee do
      first_name 'Tracy'
      last_name 'Myers'
      role 'Scrum Master'
    end

  end

end
```

And once the DSL has been parsed it will make the data available as objects like this:

```ruby
company.departments.each do |department|

  puts department.name

  department.employees.each do |person|

    puts "  #{person.first_name} #{person.last_name}: #{person.role}"

  end

end
```

Which should output:

```
Development
  Josh Nesbitt: Software Engineer
  Leon Davis: Software Engineer
Management
  Tracy Myers: Scrum Master
```


## Walk-through

_Coding walk-through to be done in person with group._


## Solutions

* [Building and parsing the DSL](1-build-and-parse.rb)
