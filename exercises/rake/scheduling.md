# Scheduling rake tasks using cron

Often an application will require scheduled jobs. These are usually either clean-up, data aggregation or caching related but there are endless possibilities. You'll want to use rake for these right?

If you are unfamiliar with cron there is a great [introduction](http://www.unixgeeks.org/security/newbie/unix/cron-1.html) available but in short if you can run it via the command line then you can get cron to run it for you.

Something to remember about cron is that it will not neccessarily run in your context so being highly explicit is the best practice.
 * Absolute path to the project
 * Absolute path to the rake executable
 * Specify all environment variables
```
cd /path/to/project && /usr/local/bin/rake ENV=production my_namespace:my_task
```

[Scheduling on Heroku](https://devcenter.heroku.com/articles/scheduler) works in a very similar way.
