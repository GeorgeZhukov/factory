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

require 'rubygems'
require 'bundler/setup'

require 'factory'

MyFactory = Factory::Factory.new("Man", :name, :age) do
  def greeting
    "Hello #{name}!"
  end
end

george = MyFactory.new("George", 17)

# Check method from block
puts george.greeting

# Check property accessors
puts george.name
puts george[:age]
puts george[0]

# Change value
george[1] = 21
puts george[1]

# Print values
george.each do |value|
  puts value
end

# Print key => value pairs
george.each_pair do |key, value|
  puts "#{key} - #{value}"
end


```
