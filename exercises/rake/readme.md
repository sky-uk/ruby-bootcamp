# Rake

[Rake](https://github.com/ruby/rake "Official Rake Github") is a build tool; it's purpose to automate the repetative tasks that we as developers do as part of building and deploying a project. You might have used tools that have a similar purpose before (Make, Ant, Maven, phing, etc) when using other languages.

`rake` is a command-line tool that comes with the rake gem, it is often bundled with ruby distributions (e.g. ruby-build in homebrew).

A `Rakefile` is the file where a project defines what it's tasks are and the instructions for rake to execute in order to complete those tasks.

Many Ruby projects come with rake task integrations to help automating them.

## Installing rake
Now is probably a good time to check if you have rake installed and if not then install it. Try running `rake --version` or `gem list | grep rake` and you'll see if you already have it. To install it there are a few options:
* Install the gem: `sudo gem install rake`
* Using homebrew: `brew install ruby-build`

## The Rakefile
The Rakefile is a plain text file that usually sits in the root directory of your project. Its syntax looks a lot like ruby because it is ruby! Everything you can do in ruby can be part of your rake task execution.

Lets start with a simple example that just displays some messages. You can find this file at /exercises/rake/Rakefile.
```
desc "A Task to remind me of the date"
task :date do
  puts 'The date today is: ' + Time.new.strftime('%d/%m/%y')
end
```

Technically the `desc 'Some description here'` part is optional but it's good practice. Especially if you want to help new users as they can use `rake -T` or `rake --tasks` to get a list of tasks with their descriptions. Try getting a list of tasks for our Rakefile using one of those commands then run the 'date' task with `rake date`.

By default the `rake` command looks for the file `./Rakefile` but you can provide a path to an alternate Rakefile. This isn't common but we're using it in this exercise to keep the examples isolated from each other and easier to understand, try this: `rake --rakefile lib/tasks/alternate_path_rakefile.rake date`

## Common types of tasks
* [RuboCop](https://github.com/bbatsov/rubocop) to check code against style guidelines. Try `rake --rakefile lib/tasks/rubocop.rake style` then have a read of the rake task file.
* [RSpec](https://www.relishapp.com/rspec/rspec-core/docs/command-line/rake-task) for running tests. Try `rake --rakefile lib/tasks/rspec.rake spec` and take a look at the rake file.
* Cleaning out temporary files. Rake has a built-in helper for cleaning files called 'rake/clean', use `rake --rakefile lib/tasks/clean.rake clean` and `rake --rakefile lib/tasks/clean.rake clobber` to see them in action.
* Regenerating data files to start from a known state.
* Building dependancies from sources; this may includes things like sass to css compliation as well as javascript contatination and minification.

## Other useful things
* Task [inter-dependancy](./dependancies.md) and the 'default' task (also `rake -P`)
* [Taking input via command-line arguments and environment variables](./input.md)
* [Using the shell](./shell.md) to run other command-line applications
* Testing your rake tasks
* Managing a large number of tasks using namespaces
* Scheduling rake tasks using cron
* What happens if you rely on something that doesn't exist within the context of your environment (e.g. :dev, :test, :production)
