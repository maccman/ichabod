module Ichabod
  module Tests
    
    def qunit(url)
      runtime = Ichabod::Runtime.new
      runtime.navigate(url)
      runtime.eval_file "./qunit"
      runtime.run
    end
    
    def jasmine(url)
      runtime = Ichabod::Runtime.new
      runtime.navigate(url)
      runtime.eval_file "./jasmine"
      runtime.run
    end
    
    extend self
  end
end