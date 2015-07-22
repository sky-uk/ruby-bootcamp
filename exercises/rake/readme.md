# Rake

Rake is the defacto gem for creating scripts that orchestrating building project and other project related tasks.

Pretty much every Ruby project you ever look at will have a 'Rakefile' and now its time for you to start writing them.

A lot of projects come with rake tasks that make using them easy.


## Thirdparty Tasks


### Write a Rakefile

Using the code supplied in exercise10, write a Rakefile that:

- can be used to run the all of the tests
- can fix code formatting issues using sensible defaults.
- by default runs the tests followed by the code formatting.

**Hint:** take a look at the [RSpec](https://www.relishapp.com/rspec/rspec-core/docs/command-line/rake-task) and [RuboCop](https://github.com/bbatsov/rubocop) documentation


### Configure RuboCop

You will notice that there are a few formatting issues that can not be automatically fixed.

Work out how to use Rubocop to:

- change the maximum allowed line length
- disable the comments warning for split_set_spec.rb


## Create your own Rake Task

Create a rake task which lists a directories contents and filters the output to a given pattern.

The script should be called like this:

```
rake list[path,pattern]
```

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

You should also spend some time testing your task using what you've learnt in previous exercises. How would you test calling the Rake task? Can you break it?

**Note:** Don't forget to add a helpful description so that users of your task can discover it.
