describe "include", ->
  
  HelloModule = 
    sayHi: ->
      "Hello!"

  ByeModule =
    sayBye: ->
      "Bye!"

  BazModule =
    sayHi: ->
      "Hello #{@name}!"
    included: (klass) ->
      klass.baz = "Baz!!"

  it "includes functions from the module into a class", ->
    class Foo
      constructor: ->
        include(@, HelloModule)

    foo = new Foo()
    expect(foo.sayHi()).toEqual("Hello!")

  it "includes multiple modules", ->
    class Foo
      constructor: ->
        include(@, HelloModule, ByeModule)

    foo = new Foo()
    expect(foo.sayHi()).toEqual("Hello!")    
    expect(foo.sayBye()).toEqual("Bye!")    

  it "calls the 'included' function if available", ->
    class Foo
      constructor: ->
        include(@, BazModule)

    foo = new Foo()
    expect(foo.baz).toEqual("Baz!!")

  it "binds the functions to the class", ->
    class Foo
      constructor: ->
        include(@, BazModule)

    foo = new Foo()
    expect(foo.sayHi()).toEqual("Hello undefined!")

    foo.name = "Mark"
    expect(foo.sayHi()).toEqual("Hello Mark!")

    x = (fn) -> fn()

    expect(x(foo.sayHi)).toEqual("Hello Mark!")
