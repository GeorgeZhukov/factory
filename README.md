# Factory

Ruby core struct analog.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory', :git => "git://github.com/GeorgeZhukov/factory"
```

And then execute:

    $ bundle

## Usage

```ruby

require 'factory'

User = Factory::Factory.new(:name, :city)

george = User.new "George", "NC"
puts george.name
puts george.city
puts george[0]

```
