# http://developer.apple.com/documentation/Cocoa/Reference/WebKit/ObjC_classic/index.html

module Ichabod
  class Runtime
    attr_reader :webView
    
    def initialize(options = {})
      @webView = WebView.new      
      @webView.setFrameLoadDelegate(Delegate::Load.new(self))
      @webView.setUIDelegate(Delegate::UI.new(self))
      load_dom(options[:dom]) if options[:dom]      
    end
        
    def navigate(url)
      # Local file check
      unless url =~ /^http/
        url = "file://" + File.expand_path(url)
      end
      
      url = NSURL.alloc.initWithString(url)
      @webView.mainFrame.loadRequest(NSURLRequest.requestWithURL(url))
      self
    end
    alias_method :open, :navigate
                  
    def eval(js)
      @webView.windowScriptObject.evaluateWebScript(js)
    end

    def eval_file(file)
      file = File.expand_path(file.to_s, Ichabod::JS_PATH)
      if File.exists? file
        eval File.read(file)
      elsif File.exists? file + '.js'
        eval File.read(file + '.js')
      end
    end

    def load_dom(dom, base_url = nil)
      @dom = File.exists?(dom) ? File.read(dom) : dom
      @webView.mainFrame.loadHTMLString(@dom, baseURL:base_url)
    end

    def to_s
      @dom ? html_source : super
    end

    def html_source
      eval("document.documentElement.outerHTML")
    end
    
    def run
      unless NSApplication.sharedApplication.running?
        NSApplication.sharedApplication.run
      end
    end
  end
end