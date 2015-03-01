# Mensurable

A simple gem to manage anything that can be measured. You can define, convert, scale, combine, and compare measures of physical magnitudes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mensurable'
```

And then execute:

  $ bundle

Or install it yourself as:

  $ gem install mensurable

## Usage

To manipulate measures of an already defined physical magnitud just refer to them directly
  to scale them:
    (3.inches * 12).to_s #=> '36 inches'
    (3.inches * 12).to_f #=> 36.0
    (3.inches * 12).to_i #=> 36

  to compare them:
    1.kilogram > 100.grams #=> true
  
  to convert them:
    1.cup.to_tbsp.to_s #=> '16 tablespoons'

  to combine them:
    (5.meters + 7.kilometers).to_km.to_s #=> '7.005 kilometers'

Some already defined magnitudes are Length, Area, Volume, Time and Weight.

To define any new physical magnitud you must specify its class name and some units of measure and its equivalences:

  Energy = Mensurable::Magnitude.new 'J' => 1, 'kJ' => 1e3

  Energy.new(1, 'J').class #=> Mensurable::Energy

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mensurable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
