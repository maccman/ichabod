#
# It's pretty much that easy.
#

if !defined?(RUBY_ENGINE) || RUBY_ENGINE != 'macruby'
  abort "Ichabod requires MacRuby. http://www.macruby.org/"
end

framework 'WebKit'

require 'ichabod/runtime'
require 'ichabod/coercion'
require 'ichabod/script_object/ruby'
require 'ichabod/script_object/ichabod'
require 'ichabod/delegate/ui'
require 'ichabod/delegate/load'
require 'ichabod/tests'

module Ichabod
  JS_PATH = File.join(File.dirname(__FILE__), "js")
  
  def self.eval(js)
    Runtime.new.eval(js)
  end

  def self.eval_file(file)
    contents = File.read(File.expand_path(file))
    eval(contents)
  end

  def self.parse(dom)
    Runtime.new(:dom => dom).run
  end
  
  def self.open(url)
    Runtime.new.open(url).run
  end
end
