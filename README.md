# luhn_util

A simple Ruby utility to validate and generate Luhn-compliant numbers.

`luhn_util` is able to:
- Validate an input according to the Luhn algorithm
- Generate random Luhn number based on any valid length and prefix

The algorithm followed is based on [Luhn Algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm).

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add luhn_util
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install luhn_util
```

## Usage
Require the file:
```shell
require 'luhn'
```
To check if input is valid:
```shell
$ Luhn.valid?('5185443765446305')
$ true
```
The `generate` method returns a 16-character number by default:
```shell
$ Luhn.generate
$ 5185443765446305
```
Length may also be specified:
```shell
$ Luhn.generate(length: 8)
$ 29974938
```
Prefix may also be supplied:
```shell
$ Luhn.generate(prefix: '88')
$ 8821951428417137

$ Luhn.generate(length: 8, prefix: '88')
$ 88405022
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/katpadi/luhn_util. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/luhn_util/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the luhn_util project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/katpadi/luhn_util/blob/main/CODE_OF_CONDUCT.md).
