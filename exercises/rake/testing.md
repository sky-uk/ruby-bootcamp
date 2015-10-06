# Testing your Rake Tasks

We test rake tasks because:
 * Rake tasks are code an therefore deserve to be tested.
 * You will change them and tests provide a great refactoring goal.
 * It will help with your design, it's not ok for tasks to grow; they are like methods and should be treated as such.
 * It will give you confidence in things that will be frequently used (e.g. scheduled tasks).

There are 2 main tactics to testing your rake tasks.
 1. Treat rake like a [front controller](http://www.martinfowler.com/eaaCatalog/frontController.html), use sub-controllers so your rake tasks are just making a single method call. This allows you to encapsulate the logic in an easily testable class.
```
# TaskController acts as a subcontroller for rake tasks
class TaskController
  def alpha_task(message)
    puts '*' * 30
    puts '    ' + message
    puts '*' * 30
  end

  def beta_task(message)
    puts 'X' * 30
    puts '    ' + message
    puts 'X' * 30
  end
end

desc 'banner style A'
task :bannerA  do
  tc = TaskController.new
  tc.alpha_task 'style A'
end
desc 'banner style B'
task :bannerB  do
  tc = TaskController.new
  tc.beta_task 'style B'
end

task default: [:bannerA, :bannerB]
```
 2. Test your rake inputs & outputs using rspec as described by [Josh Clayton's article: Test Rake Tasks Like a BOSS ](https://robots.thoughtbot.com/test-rake-tasks-like-a-boss).
 
## Exercises
 1. Refactor [the above code](./lib/tasks/testing_subcontroller.rake) to make it more testable and write the rspec tests for the class TaskController.
 2. Include rake task tests to validate the tasks can get called correctly.
