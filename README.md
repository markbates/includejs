# Includejs

Allows you to inject functions and properties from other JavaScript objects into your current object. This is similar to the functionality provided by `_.extend` in the [Underscore.js](http://documentcloud.github.com/underscore/#extend) library, the difference being that Includejs will bind the functions to the current object, helpful well dealing with callback functions.

## Installation

### Ruby/Rails

Add this line to your application's Gemfile:

    gem 'includejs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install includejs

### Rails

Require `includejs` in your asset pipeline and you're ready to go.

### Non-Rails

To use this outside of a Rails application simply copy the `vendor/assets/javascripts/includejs.js` file and add it to your application. That's it.

## Usage

### CoffeeScript Example:

``` coffeescript
BazModule =
  sayHi: ->
    "Hello #{@name}!"
  # If there is an 'included' function it will
  # be called when the module is included.
  included: (klass) ->
    klass.baz = "Baz!!"

class Foo
  constructor: ->
    include(@, BazModule)

foo = new Foo()
foo.sayHi() # => "Hello undefined!"

foo.name = "Mark"
foo.sayHi() # => "Hello Mark!"
```

### JavaScript Example:

``` javascript
var BazModule, foo;

BazModule = {
  sayHi: function() {
    return "Hello " + this.name + "!";
  },
  // If there is an 'included' function it will
  // be called when the module is included.
  included: function(klass) {
    klass.baz = "Baz!!";
  }
};

foo = {}
include(foo, BazModule);

foo.sayHi(); // => "Hello undefined!"

foo.name = "Mark";

foo.sayHi(); // => "Hello Mark!"
```

## Testing

1. Run `bundle install`.
2. Run `guard` or alternatively `rake`.
3. **Write your tests. No pull request will be accepted without tests.**

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
