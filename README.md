# Alexa String Tools

Adds utility methods to Ruby strings that convert a user's spoken words as reported by Alexa into the same format the user would have typed using a keyboard.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alexa_string_tools', github: 'bullet-train-co/alexa_string_tools'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alexa_string_tools

## Usage

### Email Addresses

Getting an email address via a conversation with Alexa is difficult and won't always work, but in some cases it can.

For example:

```
"john smith underscore two thousand and eighteen at gmail dot com".email_from_alexa
```

Returns `johnsmith_2018@gmail.com`. And:

```
"j. o. n. dot smith at gmail dot com".email_from_alexa
```

Returns `jon.smith@gmail.com`.

It's recommended that when using this method, you make a point of spelling back the entire email address to the user to make sure you haven't made any mistakes. (We'll add a method for this.) You can also prompt users to spell their input letter-by-letter, but even then sometimes Alexa will report `b.` when a user said `v.`, etc.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bullet-train-co/alexa_string_tools. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AlexaStringTools project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bullet-train-co/alexa_string_tools/blob/master/CODE_OF_CONDUCT.md).
