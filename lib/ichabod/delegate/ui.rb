module Ichabod
  module Delegate
    class UI
      attr_reader :runtime
      
      def initialize(runtime)
        @runtime = runtime
      end
    
      def webView(webView, addMessageToConsole:message)
        puts message[:sourceURL] + ":" + 
             message[:lineNumber].to_s + " " + 
             message[:message]
      end
    end
  end
end
    