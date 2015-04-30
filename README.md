# Factory

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/factory`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory

## Usage

```ruby

require 'factory'

User = Factory::Factory.new(:name, :city)

george = User.new "George", "NC"
puts george.name
puts george.city
puts george[0]

```
