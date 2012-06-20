
/*
Includejs

https://github.com/markbates/includejs
*/


(function() {
  var _this = this,
    __slice = [].slice;

  this.include = function() {
    var key, klass, mod, modules, value, __binder, _i, _len, _results;
    klass = arguments[0], modules = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
    __binder = function(fn, me) {
      return function() {
        return fn.apply(me, arguments);
      };
    };
    _results = [];
    for (_i = 0, _len = modules.length; _i < _len; _i++) {
      mod = modules[_i];
      if (mod.included != null) {
        mod.included(klass);
      }
      _results.push((function() {
        var _results1;
        _results1 = [];
        for (key in mod) {
          value = mod[key];
          if (key !== "included" && key !== "include") {
            _results1.push(klass[key] = __binder(value, klass));
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
