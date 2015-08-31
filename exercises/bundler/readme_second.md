# Bundler

Bundler is the most commonly used dependency manager on top of
rubygems.  It's a solution to the problem we ran into with the `json`
gem in `readme_first.md`: how to decide on a single version of an
upstream library when two of our direct dependencies express differing
constraints.

If you're writing either an application or a library, you will want to
use Bundler to help manage your dependencies.  While there are
dependency management tools built in to rubygems directly, they aren't
as complete as those provided by Bundler.

Bundler itself is distributed as a gem.  You'll need to `gem install
bundler` into your sandbox now.  If you haven't already, you may also
want to add `$GEM_HOME/bin` to your `$PATH`.

If you've already watched the bundler railscast in the bootcamp Prezi
presentation, you should already have seen the ideas here, so this is
your chance to use that knowledge.

## Listing your application's dependencies

There's a Hello World sinatra app in the `hello-bundler` directory.
Don't worry if you haven't done the sinatra exercise yet, you don't
need to understand what the app does here.  Use the documentation at
http://bundler.io/#getting-started to add a `Gemfile` to
`hello-bundler`.  The only dependency you need to list at this point
is `sinatra`.

Next, following the instructions on http://bundler.io, install the
dependencies, and run the app with:

    `ruby app.rb`

You should now be able to open `http://localhost:4567` in your
browser, and see that the app is working.

Add a dependency on `puma`, specifying that you want exactly
version 2.13.3.  Install it with `bundle`, and run the app again.

Change your specification to say that you want the most recent 2.13.X
version, and run `bundle` again.  Which version did Bundler pick?  Did
it install the most recent version available on http://rubygems.org ?

## Isolating your application from others

Running `ruby app.rb` in the previous step relied on rubygems to load
the right version of the dependencies which Bundler installed for us.
We were using Bundler as a more advanced version of the `gem install`
command.  That's often all you need, but what if you want to have two
conflicting sets of dependencies in the same sandbox?

Inside the `hello-rake` directory, you'll see that there are two
projects, `rake0.9` and `rake10`, each with a similar Rakefile, but
differing Gemfiles.  Again, don't worry if you haven't done the `rake`
exercise yet, you don't need to know how it works here.  `cd` into
each of these and install their dependencies with bundler.  Note which
version of the `rake` gem each installs.  How do their Gemfiles differ
to make that happen?

In both the `rake0.9` and the `rake10` directory, run
`$GEM_HOME/bin/rake`.  What's gone wrong?

Find out how to use the `bundle` command to run `rake` in each of
these directories to make the versions match up.

## Telling other people what versions you've used

If two people install dependencies from the same `Gemfile` at
different times, they might end up with different versions of their
dependencies, because new versions of libraries have been released
between them.  Bundler allows you to lock the versions of *all* your
Ruby dependencies at once, so that you know that anyone installing
your application at a later date will have the same set of
dependencies that you have tested with.  This mechanism is the
`Gemfile.lock` file.  If you have a look in the `rake0.9` and `rake10`
directories from the previous step, you should see that this has been
generated.

On what projects should you commit `Gemfile.lock` to source control?

On what projects should you not?


## Further reading

This exercise scratches the surface of what Bundler does, but covers
the most critical, day-to-day functionality you'll need.  To dig a bit
deeper, here are some starting points:

- How does `bundle update` differ from `bundle install`?
- What is `bundle install --standalone`?  What does it let you avoid?
- How do you list a dependency on a gem on Github in a `Gemfile`?
- Why was `bundle lock` added?
- How does `bundle install --deployment` differ from `bundle install`?
