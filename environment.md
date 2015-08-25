# Environment Setup


## Introduction

In order to set yourself up for this course properly you are going to need a machine with Ruby installed and some accounts.


## Setup your environment

You are going to need administrator access to your laptop to install the software that we are going to use. With the help of the group facilitator you can make the request.

After you have got administrator rights you are going to need to do a few bits and pieces:

* Register a Google Apps account to use Hangouts with
* Install Slack and get an invite to the Sky or Sky Training team from your facilitator (we use this for most communication)
* Install Google Chrome from the web (not Sky's self serve app store)
* Install the Google Hangouts Chrome extension (we'll use this for video calling in the event we're working remotely)
* Register for a Floobits account (Floobits is a really great service that will allow us to write code together)
* Register a Github account (if you don't already have one)
* Get access to Safari Books Online
* Get access to Pluralsight
* Get access to codeschool


## Install Ruby

To install Ruby we're going to use a tool called [`rbenv`](https://github.com/sstephenson/rbenv). To install this tool you can use [Homebrew](http://brew.sh/).

For more information about installing this tool, [consult the readme](https://github.com/sstephenson/rbenv#homebrew-on-mac-os-x).

The short version of this is:

```
# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install rbenv

brew update
brew install rbenv ruby-build

# Install a Ruby version

rbenv install 2.2.3
```


## Checkout the bootcamp materials

The [ruby-bootcamp](https://github.com/Ladtech/ruby-bootcamp) repository is the starting point for the bootcamp. You'll want to [fork the repository](https://github.com/Ladtech/ruby-bootcamp) and clone it locally. Start by reading the [readme](https://github.com/Ladtech/ruby-bootcamp/blob/master/readme.md).


## Setup Floobits

Floobits has a few features that require you to be authenticated against your account. Login in to Floobits and follow the instructions in under your settings area to create a .floorc.json in the home area of you VM.

This step is optional as you may not require Floobits to pair with your facilitator (as they might be in the same room).
