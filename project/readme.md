# Twitter User Interface

## Introduction

The aim of this project is to provide a rough brief of expected functionality, without steering you too much in the direction of a particular solution. The end result should be a sum of all you've learnt during the bootcamp, making use of technologies you've picked up along the way.


## Prerequisites

Before interacting with the Twitter API you will need to [register an application](https://apps.twitter.com/) to ensure you have credentials to authenticate against the API with.

![Setting up an application](http://wearest.ac/1lF02+)

Once setup you will have a consumer key and secret which you can use to make requests (alongside a valid access token and secret) to the API.

![API credentials](http://wearest.ac/1gEz2+)


## Brief

You should deliver a deployed Sinatra application which serves as an alternative user interface to the main Twitter website. It should implement the following techniques and functionality:

* Display a users home timeline
* Display a users mentions
* Display a users favourites
* Display a users direct messages
* Allows a user to search tweets
* Allow a user to post new tweets
* Allow a user to favorite tweets
* Allow a user to retweet tweets

Use of JavaScript is not required. This is a test of your Ruby knowledge, not building single page JavaScript applications.


## Tools and Techniques

* Setup a Gemfile
* Use of third party gems
* Using objects to model data (such as a `Tweet`)
* Format dates in a human readable form
* Use of view partials
* Implement view helpers
* Use of Foreman to deploy the application
* Deploy the application to Heroku


## Bonus Points

To show off, here's some extra features which would demonstrate some more advanced Ruby topics (in priority order):

* Add "Sign in with Twitter" flow
* Highlight usernames and hashtags in tweets
* Add a view user profile page to link highlighted usernames to
* Auto-link external links
* Use SCSS for stylesheets
* Add geo-location information to posted tweets
* Add image uploads to posted tweets
* Add inline image previews
