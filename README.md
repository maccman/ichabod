#Ichabod

Run JavaScript tests from the command line using a headless version of WebKit.

Features:

  * [Jasmine](http://pivotal.github.com/jasmine) tests support
  <!-- * [QUnit](TODO) tests support -->
  * Use Ruby methods from JavaScript

## Prerequisites

The only prerequisites are OSX and [macruby](http://www.macruby.org).

## Usage
    
    ichabod ./your/file.html
    ichabod http://example.com
    
    ichabod --jasmine http://your-jasmine-test-page.html
<!-- ichabod --qunit http://your-qunit-test-page.html -->

    ichabod --jasmin ./local-qunit-path/index.html
      xxxxxxxxxxxxxoxxxxxxxxxx
      
      - X failed because of xyz
      
## More Usage

    $ ichabod
    js> 1 + 1
    => 2
    js> function name() { return "ichabod!" }
    => undefined
    js> name
    => function name() { return "ichabod!" }
    js> name()
    => "ichabod!"
    js> Ruby.puts('Ruby, I presume.')
    Ruby, I presume.
    => undefined
    js> Ruby.File_read('hi.js')
    => "// this is hi.js\n"
    js> Ichabod.exit();
    
## Credit

Credit should go to the real author behind this - [Chris Wanstrath](https://github.com/defunkt) who wrote [Lyndon](https://github.com/defunkt/lyndon). Most of the code follows his original ideas, I've extended that to add test support and enhancements to the WebKit WebView. 

And thanks to my [tweeps](http://twitter.com/maccman) who suggested the name: knewter, tiegz, enriclluelles.

## Copyright

Copyright (c) 2011 Chris Wanstrath, Alex MacCaw under the MIT LICENSE.