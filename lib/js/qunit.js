window.addEventListener("load", function(){
  var ansi = {
    green:  '\033[32m',
    red:    '\033[31m',
    yellow: '\033[33m',
    none:   '\033[0m'
  };
  
  var puts = function(str){
    Ruby.puts(str);
  };
  
  var print = function(str){
    Ruby.print(str);
  };

  QUnit.testDone = function(result){
    puts("Results for: " + result.name);
    print(ansi.red   + result.failed + " failed, " + ansi.none);
    print(ansi.green + result.passed + " passed, " + ansi.none);
    print("Total " + result.total);
    puts("");
  };

  QUnit.done = function() {
      Ichabod.exit();
  };
});