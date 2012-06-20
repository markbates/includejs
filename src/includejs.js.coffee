###
Includejs

https://github.com/markbates/includejs
###
@include = (klass, modules...) =>
  ###
  Since we can't assume there are any other
  libraries available to us, let's create our
  own simple binding function to bind the 
  module's functions to the original object.
  ###
  __binder = (fn, me) ->
    return ->
      return fn.apply(me, arguments)
  
  ###
  Loop through all of the modules that are passed in.
  ###
  for mod in modules
    ###
    If the module has a 'included' function
    then let's call it and pass it the object
    that's including the module.
    ###
    if mod.included?
      mod.included(klass)
    
    for key, value of mod
      ###
      As long as the 'key' is not the 'included' or
      'include' function, then let's include it in the
      original object and bind it together.
      ###
      unless key in ["included", "include"]
        klass[key] = __binder(value, klass)