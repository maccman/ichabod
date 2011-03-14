module Ichabod
  module Delegate
    class Load
      attr_reader :runtime
    
      def initialize(runtime)
        @runtime = runtime
      end
    
      def webView(sender, didFinishLoadForFrame:frame)
        # Page loaded...
      end
    
      def webView(webView, didClearWindowObject:windowScriptObject, forFrame:frame)
        windowScriptObject.setValue(ScriptObject::Ruby.new(runtime), forKey:"Ruby")
        windowScriptObject.setValue(ScriptObject::Ichabod.new(runtime), forKey:"Ichabod")
      end
    
      def webView(view, didFailLoadWithError:error, forFrame:frame)
        raise "Failed: #{error.localizedDescription}"
      end

      def webView(view, didFailProvisionalLoadWithError:error, forFrame:frame)
        raise "Failed: #{error.localizedDescription}"
      end
    end
  end
end