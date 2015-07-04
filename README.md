# lita-oftlog

[![Build Status](https://travis-ci.org/hickey/lita-oftlog.png?branch=master)](https://travis-ci.org/hickey/lita-oftlog)
[![Code Climate](https://codeclimate.com/github/hickey/lita-oftlog.png)](https://codeclimate.com/github/hickey/lita-oftlog)
[![Coverage Status](https://coveralls.io/repos/hickey/lita-oftlog/badge.png)](https://coveralls.io/r/hickey/lita-oftlog)

This is a Lita handler that will search Google for images based on the phrase "oh for the love of god". I had a manager that would use this phrase all the time, so of course it had to be immortialized with a Lita plugin. 

## Installation

Add lita-oftlog to your Lita instance's Gemfile:

``` ruby
gem "lita-oftlog"
```

## Configuration

Optional attributes

* safe_search (String, Symbol) - The safe search setting to use when querying for images. Possible values are :active, :moderate, and :off. Default: :active.

Example

```
Lita.configure do |config|
  config.handlers.oftlog.safe_search = :off
end
```

## Usage

The plugin will respond to two basic phrases irrespective of capitalization or spacing. 

```
Lita: oh for the love of god
Lita: oftlog
```

The phrases do not need to start the beginning of a message as normal commands need to. As long as they appear in the message text, the plugin should activate. 

## License

[MIT](http://opensource.org/licenses/MIT)

Shamelessly copied and extended from Jimmy Cuadra's [lita-google-images](https://github.com/jimmycuadra/lita-google-images)