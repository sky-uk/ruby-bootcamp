# Namespacing

When you have a lot of rake tasks you will find yourself wanting to group the tasks by some form of classification/taxonomy in order to keep them organised. This is especially true if you write your tasks with the single responsibility principle in mind as this will give you a larger volume of simple tasks over a small number of more complex ones.

Consider the following vastly over-simlpified example:
```
desc 'Run the unit tests'
task :test_unit do
    # Some code
end
desc 'Run the acceptance tests'
task :test_acceptance do
    # Some code
end
task :build_clean do
    # Some code
end
```
The 2 similar tasks can be grouped into a *namespace*. Note how you can mix namespaced and root-named tasks in the same rakefile.
```
namespace :test do
    desc 'Run the unit tests'
    task :unit do
        # Some code
    end
    desc 'Run the acceptance tests'
    task :acceptance do
        # Some code
    end
end

task :build_clean do
    # Some code
end
```
## Running Namespaced Tasks
Once namespaced the commands to execute the tasks change. You need to refer to the new fully-qualified name: `rake test:unit`, `rake test:acceptance` though non-namespaced tasks are still executed in the same way: `rake build_clean`.
## Exercise
Refactor the rakefile at `lib/tasks/namespace_me.rake` to use namespaces.
