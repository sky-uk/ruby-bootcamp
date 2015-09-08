# Rake Inter-Dependancies

## The 'default' Task

It's likely that you will want a short-cut to run your most common rake task. You can use the label `:default` to define the task that is run when no task name is specified (`rake` with no arguments). Normally this task will not have any instructions of its own but will instead run one or more other (dependant) tasks.

## Task Dependancies

Often you will want to have high-level rake tasks that orchestrate a number of processes that must happen in a specific order. An example of this may be to clean out temporary files, pre-compile the sass and then start the webserver in development mode.

This doesn't need to be a single rake task, it can be a set of smaller, more composable tasks that can be re-used elsewhere.

You can get a list of rake tasks including their dependancies using `rake -P`. Try it now on `rake -P --rakefile lib/tasks/dependancies.rake`.

### Exercise 1

Extend `lib/tasks/dependancies.rake` to so that it says:
```
This
 is
 the
 correct
 order
```
Check the lib/hints directory if you get stuck.
