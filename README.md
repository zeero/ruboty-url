[![Build Status](https://travis-ci.org/zeero/ruboty-url.svg?branch=master)](https://travis-ci.org/zeero/ruboty-url)

# Ruboty::Url

A Ruboty Handler + Actions to shows HTML title with specified URL.

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-url'
```

And then execute:

    $ bundle install

## Usage

<img width="773" alt="screenshot_ruboty-url" src="https://user-images.githubusercontent.com/105469/37564163-a3ef0bba-2ad3-11e8-886e-58f4c8d73957.png">

This plugin responds with messages including specified URL (such as private URL), and shows HTML title.

Reply style is Slack attachment. Please use with 'ruboty-slack_rtm' plugin.

URL is specified by 'RUBOTY_URL_REGEXP' environmental variable, value is RegExp for url that you want to show HTML title with.

ex:

```
export RUBOTY_URL_REGEXP=(https://foo.com.*|http://bar.org.*)
```

## ENV

|Name|Description|
|:--|:--|
|RUBOTY_URL_REGEXP|(required) RegExp for url.|

## Dependency

|Name|Description|
|:--|:--|
|ruboty-slack_rtm|(required) 'ruboty-url' is supposed to work with 'ruboty-slack_rtm' - Ruboty Adapter for Slack Realtime API.|

## Contributing

1. Fork it ( https://github.com/zeero/ruboty-url/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

