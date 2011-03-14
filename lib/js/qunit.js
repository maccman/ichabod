window.addEventListener("load", function(){
  QUnit.testDone = function(result){
    console.log('test Done');
    Ichabod.exit();
    // result.name
    // result.failed
    // result.passed
    // result.total
  };
});