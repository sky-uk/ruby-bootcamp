# Deploying to Heroku

This course is intended to follow the [Rails](https://github.com/sky-uk/ruby-bootcamp/blob/master/exercises/rails/README.md) one. Make sure you complete that, and have a working Rails application so you have something you can deploy to Heroku.

## What is Heroku?

Heroku is what is known as a PaaS, Platform as a Service. Deployments are done with git, and all infrastructure is managed by Heroku. Think of it as a hosting service that runs from a git repository that you don't have to manage.

There are both advantages and disadvantages to this 'black-box' approach. If you are running a complex application stack, then it can be difficult to get Heroku to play nicely with all your dependencies, and if something goes wrong it can be difficult to diagnose. The advantages usually come in the form of not having to worry about package updates, load balancing and server maintenance.

## How do I deploy to Heroku?

This is mostly for you to figure out but you can get started by creating a [free account](https://signup.heroku.com/www-header). Unless you have done something unusual within your previous Rails project, such as using a NoSQL data store (which would require Heroku addons) then you should be able to launch your app on their free tier.

Here are a couple of pointers to get you started:

* Heroku does not support SQLite as a database, and states a preference towards PostgreSQL. You may need to convert your application to Postgres.
* By default, Rails uses Webrick as an app-server and shouldn't be used in a production environment since it only allows one connection at a time. Valid choices would be [Puma (recommended by Heroku)](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server), or [Passenger 5](https://www.phusionpassenger.com/)
* Don't forget to run a `rake db:migrate` through the [Heroku run command](https://devcenter.heroku.com/articles/rake).

## Resources

### 12 Factor

A series of 12 articles designed to improve the deployment of 'web apps' has been dubbed [12 factor methodologies](http://12factor.net/). These are designed to create maximum portability of your app, enable scalability and automate setup.

### Comparison of App Servers

There are many comparisons of Rails app servers out there but many of them don't cover the depth, or the _why_ of why some are better than others. [This](http://www.nateberkopec.com/2015/07/29/scaling-ruby-apps-to-1000-rpm.html) blog post covers most of them and it'd be worth looking over it so you can make an informed choice on which one to use.

### Heroku Docs

The [Heroku Docs](https://devcenter.heroku.com/articles/getting-started-with-ruby#introduction) are actually pretty good and deserve a read through if you get stuck.