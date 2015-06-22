# Rake
Rake is the defacto gem for creating scripts that orchestrating building project and other project related tasks.

Pretty much every Ruby project you ever look at will have a 'Rakefile' and now its time for you to start writing them.

# Exercise:
A lot of projects come with rake tasks that make using them easy.

## Thirdparty Tasks
Using the code supplied in exercise10, right a Rakefile that:

- can be used to run the all of the tests
- can gather code coverage for the production classes only
- by default runs the tests followed by the code coverage

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
light.png
lightning.png
lightpost.png
smile.jpg
solar_system.jpg
solutions.png
star-tunnel.png
summer_cloud.jpg
summer_grass.jpg
tabula-rasa.png
teal-pixels.jpg
```

You should also spend some time testing your task using what you've learnt in previous exercises. How would you test calling the Rake task? Can you break it?

Note: Don't forget to add a helpful description so that users of your task can discover it.


