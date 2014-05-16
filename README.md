Knowed
===

This is intended to be a Framework that helps turn JavaScriptCore into a
useful non-web runtime.  It should remind folks of "node.js".


Notes
---

Here are some built-in objects already in JavaScriptCore.

* Math
* JSON
* Number
* RegExp
* Boolean
* String

ToDo
---

* produce both OS X Framework & iOS library
* generic alert/prompt
* log with varargs
* File I/O
* http/https
* storage APIs
 * WebSQL
* crazy shit
 * WebGL?

Usage
---

Just invoking the JavaScript interpreter is pretty easy.  You can create a JSContext and  send it a sequence of "evaluateScript" method calls.  The problem is, the base implementation is lacking a lot of objects and methods that would make it actually *useful*.  I'm trying to provide a bunch of those, plus a class that can be subclassed in order to make adding more easy.

The basic idea is to create an Objective-C class with an "addSelfToContext" method.  Inside the class, there's a "name" that's meant to indicate the name of the JavaScript variable that's supposed to hold the reference to the object, and an "eval" that contains JavaScript code that finishes setting things up.  Why the latter?  Because sometimes what you want to do isn't easily represetned just by adding an Objective-C object.  (Look at the way "KnowedUtil" implements alert() and prompt() to see what I mean.)

More later.