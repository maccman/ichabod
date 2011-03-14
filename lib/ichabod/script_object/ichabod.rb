module Ichabod
  module ScriptObject
    class Ichabod
      attr_reader :runtime
    
      def initialize(runtime)
        @runtime = runtime
      end
    
      def open(url)
        runtime.open(url)
      end
    
      def eval(js)
        runtime.eval(js)
      end
    
      def exit(code = 0)
        Kernel.exit(code)
      end
    
      def sleep(secs = 0)
        Kernel.sleep(secs)
      end
    
      def args
        ARGV
      end
    
      def invokeUndefinedMethodFromWebScript(name, withArguments:args)
        send(name, *args)
      end
    end
  end
end