
/*
Includejs

https://github.com/markbates/includejs
*/


(function() {
  var _this = this,
    __slice = [].slice;

  this.include = function() {
    var key, klass, mod, modules, value, __binder, __isFunction, _i, _len, _results;
    klass = arguments[0], modules = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    /*
      Since we can't assume there are any other
      libraries available to us, let's create our
      own simple binding function to bind the 
      module's functions to the original object.
    */

    __binder = function(fn, me) {
      return function() {
        return fn.apply(me, arguments);
      };
    };
    /*
      Since we can't assume there are any other
      libraries available to us, let's create our
      own function to check whether an object is a
      function or not.
    */

    __isFunction = function(fn) {
      return !!(fn && fn.constructor && fn.call && fn.apply);
    };
    /*
      Loop through all of the modules that are passed in.
    */

    _results = [];
    for (_i = 0, _len = modules.length; _i < _len; _i++) {
      mod = modules[_i];
      /*
          If the module has a 'included' function
          then let's call it and pass it the object
          that's including the module.
      */

      if (mod.included != null) {
        mod.included(klass);
      }
      _results.push((function() {
        var _results1;
        _results1 = [];
        for (key in mod) {
          value = mod[key];
          /*
                As long as the 'key' is not the 'included' or
                'include' function, then let's include it in the
                original object and bind it together.
          */

          if (key !== "included" && key !== "include") {
            _results1.push(klass[key] = (function() {
              if (__isFunction(value)) {
                /*
                            If the value is a function then let's
                            bind it to the current object.
                */

                return __binder(value, klass);
              } else {
                /*
                            The value isn't a function, so let's just
                            set it and forget it.
                */

                return value;
              }
            })());
          } else {
            _results1.push(void 0);
          }
        }
        return _results1;
      })());
    }
    return _results;
  };

}).call(this);
