# Linguine

Having watched this [video](https://www.youtube.com/watch?v=iJ-ZsWtHTIg) and seen the some of the cool things you can do with Rack. It's time to get your hands dirty.

In this exercise you are going to write your very own Rack web framework that we call Linguine.

This framework will be specifcally designed to make writing applications that serve multi lingual content a doddle.


## Imagine this

You are fast growing business and you currently have an application serving your homepage. You're a UK based company and the page that people see when they visit your site is naturally displayed in English. Things are going so well that you are planning to move in to Europe and you are going to need to translate your site. This could be expensive and very time consuming ...

This is where Linguine steps in to the rescue or at least it will once you have written it :)


## Required features


### Dynamic page translation.

Implement a feature in to Linguine that will allow a user to append a locale extension to the URL to receive the translated version of a page.

E.g. `http://yoursite.com/home.de` to get the german translation of the page.


#### The interface

The interface should be seemless to users of your framework so Linguine should require them to little or ideally nothing to have this capability within their application.

Wouldn't it be great to write something like...

```
require 'linguine'
class HomePage < Linguine
  #Framework compatible code for returning your page content
end

run HomePage
```


#### Getting translations

The Bing [Translation API](https://www.microsoft.com/translator/getstarted.aspx) provides a nice [HTTP interface](https://msdn.microsoft.com/en-us/library/ff512387.aspx) that you can use to get translations from.

Write your own client to connect to this service. HTTP clients like Faraday(https://github.com/lostisland/faraday) or [HTTParty](https://github.com/jnunemaker/httparty) should help with this. Note: Faraday is used a bit on other Sky projects.


### Caching

Using an external service can have costs both in terms of time and money. Therefore we don't want to hit Bing for translations we have already got. Build a feature in to linguine so that it only retranslates content that it does not yet have the definitions for.


## Technical Requirements


### Testing.

When testing your web integrations its good for your tests to:

- run at the speed of light
- not need a connection to the internet
- run consistently.

In this case we are unlikely to want to use a live translation service that could become unavailable or change the translations that it returns. Look in to [Webmock](https://github.com/bblimke/webmock) and how it can help with the tests that you write.


### Development mode

The account that you get with Bing will allow 2M characters to be translated for free. After that you will need to start paying. In the development of this framework it is likely that you will hit the service many times so we will need an alternative datasource and client to call it. The [google-translate](https://github.com/shvets/google-translate) gem could be the answer we are looking for. It hits the [Google Translate site](https://translate.google.co.uk/) directly and therefore doesn't require an account with quota.
If you look at [translate_cli.rb](https://github.com/shvets/google-translate/blob/master/lib/google_translate/translate_cli.rb) you will see that it uses the GoogleTranslate and ResultsParser classes to get translations.
