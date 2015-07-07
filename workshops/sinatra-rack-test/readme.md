# Sinatra Testing with `Rack::Test`


## Introduction

We're going to create a simple Sinatra application that authenticates a user via a JSON API and returns an authentication token. For now the user credentials (username/password) will be hard-coded.

The application will be tested with [Rack::Test](https://github.com/brynary/rack-test) and should have at least two test cases:

* Testing a user successfully authenticates and receives an authentication token
* Testing a user fails to authenticate and returns an empty response


## Example Output

The response for a successful request should be similar to:

```
{
  success: true,
  token: '32925e4e8b6648afa2659f807e74cce8'
}
```

The response for an unsuccessful request should be similar to:

```
{
  success: false,
  token: null
}
```

This response should also return a 401 Unauthorized status code.


## Walk-through

_Coding walk-through to be done in person with group._


## Solutions

* [Basic example](1-basic.rb)
* [Authentication stub object](2-authentication-object.rb)
* [JSON service](3-json-service.rb)
* [Testing with `Rack::Test`](4-testing.rb)
