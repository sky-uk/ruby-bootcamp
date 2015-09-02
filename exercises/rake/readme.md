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

<<<<<<< HEAD
### Write a Rakefile

Using the code supplied in [lib](lib), write a `Rakefile` that:

* Can be used to run the all of the tests
* Can fix code formatting issues using sensible defaults
* By default runs the tests followed by the code formatting

_Hint: take a look at the [RSpec](https://www.relishapp.com/rspec/rspec-core/docs/command-line/rake-task) and [RuboCop](https://github.com/bbatsov/rubocop) documentation._


### Configure RuboCop

You will notice that there are a few formatting issues that cannot be automatically fixed.

Work out how to use Rubocop to:

* Change the maximum allowed line length
* Disable the comments warning for `split_set_spec.rb`


## Write your own Rake Task

Create a rake task which lists a directories contents and filters the output to a given pattern.

The script should be called like this:

=======
Lets start with a simple example that just displays some messages. You can find this file at /exercises/rake/Rakefile.
>>>>>>> Complete rebuild of the rake exercise. Introduced the basics but need to further work on both exercises and more advanced material.
```
desc "A Task to remind me of the date"
task :date do
  puts 'The date today is: ' + Time.new.strftime('%d/%m/%y')
end
```
<<<<<<< HEAD

E.g:

```
rake list[resources/,*.jpg]
```

The script should be defined in a `Rakefile` and the second parameter should be optional. If omitted, the script should list all files in the directory.

The output should look like this:

```
csv_file1.csv
csv_file2.csv
csv_file3.csv
csv_file4.csv
csv_file5.csv
image1.jpg
image2.jpg
image3.jpg
image4.jpg
image5.jpg
text_file1.txt
text_file2.txt
text_file3.txt
```

You should also spend some time testing your task using what you've learned in previous exercises. How would you test calling the Rake task? Can you break it?

If you want a hint for how to get hold of your task to and test them, [click here](hints).

_Note: don't forget to add a helpful description so that users of your task can discover it._
=======
Technically the `desc 'Some description here'` part is optional but it's good practice. Especially if you want to help new users as they can use `rake -T` or `rake --tasks` to get a list of tasks with their descriptions. Try getting a list of tasks for our Rakefile using one of those commands then run the 'date' task with `rake date`.

By default the `rake` command looks for the file `./Rakefile` but you can provide a path to an alternate Rakefile: `rake --rakefile lib/tasks/alternate_path_rakefile.rake date`

## Common types of tasks
* [RuboCop](https://github.com/bbatsov/rubocop) to check code against style guidelines
* [RSpec](https://www.relishapp.com/rspec/rspec-core/docs/command-line/rake-task) for running tests
* Cleaning out temporary files
* Regenerating data files to start from a known state
* Building dependancies from sources; this may includes things like sass to css compliation as well as javascript contatination and minification.

## Other useful things
* Task inter-dependancy and the 'default' task
* Taking input via command-line arguments and environment variables
* Using the shell to run other command-line applications
* Testing your rake tasks
* Managing a large number of tasks using namespaces
* Scheduling rake tasks using cron
>>>>>>> Complete rebuild of the rake exercise. Introduced the basics but need to further work on both exercises and more advanced material.
