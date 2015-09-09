# Learning Rails

[Ruby on Rails](http://www.rubyonrails.org) is the most well known Ruby project.

Rails is used for several large applications at Sky, particularly when a customer facing UI is involved. It is less commonly used to provide pure API functionality.

To help you get on board with Rails at Sky, we have prepared a short presentation and a couple of exercises.

The aim here is to help you:

* Understand the Ruby on Rails framework - cli, convention over configuration, gems etc.
* Activerecord and databases
* See how Rails is used in Sky (with real examples)
* Be able to evaluate and take over an existing project
* Testing in Rails
* Explore the Rails ecosystem - hosting, monitoring, deployment, gems
* Evaluate when Rails might be an appropriate technology choice
* Encourage further exploration
* Write real Rails code

## Overview

Our '[Learning Rails](http://slides.com/dtt101/learning-rails)' presentation.

This is intended to give you a quick overview of the Rail approach and ecosystem, and how Rail is used at Sky.

It's worth giving one of the course team a shout to go through it with you and answer any questions.

## Task 1: TV Guide

The task is to create a simple TV guide using Ruby on Rails. This is a variable task and you can feel free to make this as involved, or as simple as you wish.

The application is for the web, but intended for use on mobile phones!

Take a look at the wireframe in [tv-guide.pdf](https://github.com/sky-uk/ruby-bootcamp/blob/learn-rails/exercises/rails/tv-guide.pdf). You'll only be showing what is on Now & Next.

The challenge here is to give some thought to your database structure and your application URL's

Here are a few acceptance criteria:

 - [ ] A user can view the TV guide in chronological order
 - [ ] A user can view a description of the selected programme
 - [ ] A user can view the start and end times of all programs
 - [ ] An editor can create new programmes
 - [ ] An editor can change the start time and end time of a programme
 - [ ] An editor can change the description of a programme

### Extensions

If you have time to carry on, then there are a few stretch goals you can aim for:

* Expose an API for the TV guide data
* Pull in extra info about the show using the TVMaze API; http://www.tvmaze.com/api

### Approach

If possible, avoid using a full model scaffold - you'll probably learn more if you don't use the scaffolding tools. Generate the model using `rails g model ...`, and then feel free to use `rails g scaffold_controller ...` to get your boilerplate views.

A standard testing setup would involve **RSpec** and **FactoryGirl**. If these are added to your Gemfile (and bundle) before you run any of the generators then it should also generate your factories and boilerplate specs.

## Task 2

Now you have had the chance to build your own project we'd like you to contribute to [sky_stack](https://github.com/sky-uk/sky_stack)!

Take a look at the issues log at the issues with the bootcamp tag and pick up something that you'd like to work on. In order to contribute to sky_stack, read the contributing section and follow the instuctions.

These issues have been laid out in a similar way to real issues you'll be working on at Sky. There are a set of acceptance criteria that you should look to meet, along with good test coverage. Happy hacking!
