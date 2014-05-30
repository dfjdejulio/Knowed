Knowed
===

This is intended to be a Framework that helps turn JavaScriptCore into a
useful non-web runtime.  It should remind folks of "node.js".

JavaSciptCore is currently very poorly documented.  There's no documentation
for the new Objective-C bits in Xcode.  I've mostly had to glean things from
WWDC presentations, random web pages from other hackers, and the source code.
(It *is* an open source project, after all.)

I noticed that the source code in Apple's repository had comments that work
with Apple's "headerdoc2html" utility.  So, I ran that on the files in
JavaWebCore/APIs, pulled out the Classes (because I don't want to think about
the bits below the Objective-C level right now), and put 'em up here:
[JavaScriptCore Documentation Snapshot](http://dfjdejulio.github.io/JavaScriptCore/).


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

* [ ] investigate [CommonJS](http://en.wikipedia.org/wiki/CommonJS) (discussed by [ArsTechnica](http://arstechnica.com/business/2009/12/commonjs-effort-sets-javascript-on-path-for-world-domination/))
* [x] produce both OS X Framework & iOS library
* [ ] generic alert/prompt
 *  [ ] Cocoa
 *  [ ] UIKit
 *  [ ] stdio
* [ ] log with varargs
* [ ] File I/O
* [ ] http/https
* [ ] storage APIs
 * [ ] WebSQL
* [ ] crazy shit
 * [ ] WebGL?
 * [ ] Add "KnowedJSContext" that sets up a JSContext with a set of utility objects and wraps it for execution in a background thread?  Could be tricky.  Could be useful.
* [x] start using issue tracker for planning

Usage
---

Just invoking the JavaScript interpreter is pretty easy.  You can create a JSContext and  send it a sequence of "evaluateScript" method calls.  The problem is, the base implementation is lacking a lot of objects and methods that would make it actually *useful*.  I'm trying to provide a bunch of those, plus a class that can be subclassed in order to make adding more easy.

The basic idea is to create an Objective-C class with an "addSelfToContext" method.  Inside the class, there's a "name" that's meant to indicate the name of the JavaScript variable that's supposed to hold the reference to the object, and an "eval" that contains JavaScript code that finishes setting things up.  Why the latter?  Because sometimes what you want to do isn't easily represetned just by adding an Objective-C object.  (Look at the way "KnowedUtil" implements alert() and prompt() to see what I mean.)

More later.
