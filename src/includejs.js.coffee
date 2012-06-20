@include = (klass, modules...) =>
  __binder = (fn, me) ->
    return ->
      return fn.apply(me, arguments)
  
  for mod in modules

    if mod.included?
      mod.included(klass)
    
    for key, value of mod
      unless key in ["included", "include"]
        klass[key] = __binder(value, klass)