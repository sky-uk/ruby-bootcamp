# Rubygems

Ruby libraries are distributed as packages called "gems", from a
central repository at http://rubygems.org.  Every project you
undertake will either be packaged as a gem library for someone else to
use, or make use of many other gems from other people.

The gem specification is a very flexible library format: they can
contain library code, executables, native code to be compiled on
installation, and more, but they're usually just used to version and
distribute Ruby code.

The fundamental command for installing, uninstalling, and otherwise
operating on gems is `gem`.

## Listing gems

Run `gem help` in a console, and find out how to get a list of the
currently installed gems.

## Installing gems

To learn more about installing gems, it's best to create yourself a
sandbox away from the gems you might already have installed.  While
it's worth knowing, the details of making that sandbox aren't
something you'll need day-to-day, so I'll just give you the steps to
go through here.

Make a new working directory, and `cd` into it.  Make a new directory
called `gems`.

Now, run `export GEM_HOME=$(pwd)/gems`.  This tells `gem`
to install everything into that directory.

Run `export GEM_PATH=$GEM_HOME`.  This tells ruby that the only place
it should look for gems to load is in the `gems` directory you've just
made.

These two environment variables are all you need to create a sandbox.
To reset your system after this exercise, just kill your current
terminal and open a new one.

Kramdown is a Ruby library and executable to convert Markdown to HTML.
With your sandbox in place, use the `gem` command to install the
`kramdown` gem.  Doing so will have installed a `kramdown` executable.
Where did it go?  You can use the `gem env` command to help find it.

The `kramdown` executable supports `--help` to list available options.
Run it.

## Installing more than one version at a time

`gem` lets you have more than one version of a dependency installed.
Install version 1.4.2 of `kramdown`.

Having more than one version of a gem installed isn't much use unless
you can use both.  The `--help` option to `kramdown` will give you the
options it supports.  List the options in both the most recent
version, and in version 1.4.2.  Which new options are supported by the
more recent version?  (Hint: `gem help install` should help here)

Find out how to show which versions of `kramdown` you have installed.

Run `irb`.  Find out how to load the `kramdown` library, and convert
the following string (without quote marks) to HTML:

    "# CHUNKY BACON!"

## Uninstalling a gem

Find out how to remove only version 1.4.2 of `kramdown`.


## Dependencies

Gems can list other gems as dependencies, to be installed at the same
time.  Install the `fpm` gem. This is a tool for building gems from
other package formats.  Which dependencies does it install?

Install the `httparty` gem.  Which dependencies does it install?

There is a common dependency between `fpm` and `httparty`.  What is
it?  What problems can you foresee from the situation you now have in
your `$GEM_HOME`?

## Exploring rubygems.org

Open http://rubygems.org in a browser, and search for the `rack` gem.
What is the most recent published version?

Find out how to get that same information with the `gem` command.
