# Cucumber


## Introduction

[Cucumber](https://cucumber.io/) is a tool that allows you to describe behaviour and write human-readable acceptance criteria.


## Prerequisites 

It would be useful (but not essential) to have completed the Rails exercise.

## Objective

Write a set of cucumber tests that describe the behaviour of the hello_app:
- Show a picture
- Edit a picture
- Cancel editing a picture
- Destroy a picture
- Create a new picture

The hello_app is a basic rails app that uses [Cucumber-Rails](https://github.com/cucumber/cucumber-rails).

You can use bundler to install all the gems required by hello_app.
See: [Rails Tutorial](https://www.railstutorial.org/book/beginning#sec-the_hello_application)

For an example of a feature file, see [cucumber/hello_app/features/example.feature].
This is using:
- Cucumber to link the feature files to the step definitions 
- Capybara to inspect the page (rails has inbuilt support for this)
- Rspec for expectations
See if you can improve the final step!

### Running the rails app

Run: 

``rake db:seed``

to populate the database with a default image, then

``rails s``

To start the server.

### Running cucumber

``RAILS_ENV="development" rake cucumber``

### Cucumber hints

Cucumber provides you with helpful snippets.

If you write your feature file first, then run cucumber:

``rake cucumber``

It will output suggested code to the console.

Ideally, Cucumber scenarios should be short, sweet, and user-friendly.

### Cucumber's limitations

TODO
