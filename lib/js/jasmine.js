// Jasmine Reporter mostly inspired/stolen from the jasmine-node project 
// which is under the (under the MIT license)
//  https://github.com/cpojer/jasmine-node

window.addEventListener("load", function(){  
  jasmine.printRunnerResults = function(runner){
    var results = runner.results();
    var suites = runner.suites();
    var msg = '';
    msg += suites.length + ' test' + ((suites.length === 1) ? '' : 's') + ', ';
    msg += results.totalCount + ' assertion' + ((results.totalCount === 1) ? '' : 's') + ', ';
    msg += results.failedCount + ' failure' + ((results.failedCount === 1) ? '' : 's') + '\n';
    return msg;
  };
  
  var ansi = {
    green:  '\033[32m',
    red:    '\033[31m',
    yellow: '\033[33m',
    none:   '\033[0m'
  };
  
  var noop = function(){};
  
  var ConsoleReporter = function(){};
  ConsoleReporter.fn  = ConsoleReporter.prototype;
  var C = ConsoleReporter;
  
  C.fn.start = 0;
  C.fn.columnCounter = 0;
  C.fn.elapsed = 0;
  C.fn.record = [];
  
  C.fn.log = function(str){
  	Ruby.puts(str);
  };
  
  C.fn.print = function(str){
    Ruby.print(str);
  };

  C.fn.reportRunnerStarting = function(runner) {
		this.log('Started');
		this.start = Number(new Date);
  };

  C.fn.reportSuiteResults = function(suite) {
		var specResults = suite.results();
		var path = [];
		while (suite) {
			path.unshift(suite.description);
			suite = suite.parentSuite;
		}
		var description = path.join(' ');
  	this.record.push('Spec ' + description);

		specResults.items_.forEach(function(spec){
			if (spec.failedCount > 0 && spec.description) {
				this.record.push('	it ' + spec.description);
				spec.items_.forEach(function(result){
					this.record.push('	' + result.trace.stack + '\n');
				});
			}
		});
	};

  C.fn.reportSpecResults = function(spec) {
  	var result = spec.results();
  	var msg = '';
  	if (result.passed()) {
  		msg = ansi.green + '.' + ansi.none;
  	} else {
  		msg = ansi.red + 'F' + ansi.none;
  	}
  	this.print(msg);
  	if (this.columnCounter ++ < 50) return;
  	this.columnCounter = 0;
  	this.print('\n');
  };

  C.fn.reportRunnerResults = function(runner) {
    this.elapsed = (Number(new Date) - this.start) / 1000;
		this.log('\n');
		
		var self = this;
		this.record.forEach(function(log){
			self.log(log);
		});
		
		this.log('Finished in ' + this.elapsed + ' seconds');

		var summary = jasmine.printRunnerResults(runner);
		if(runner.results().failedCount === 0 )
			this.log(ansi.green + summary + ansi.none);
		else
			this.log(ansi.red + summary + ansi.none);
	
		(this.done||noop)(runner, this.log);
		
		Ichabod.exit();
  };

  C.fn.reportSpecStarting = function(){};
    
  window.jasmine.getEnv().addReporter(new ConsoleReporter);
});