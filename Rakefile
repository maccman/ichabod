begin
  require 'jeweler'

  # We're not putting VERSION or VERSION.yml in the root,
  # so we have to help Jeweler find our version.
  $LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'
  require 'ichabod/version'

  Ichabod::Version.instance_eval do
    def refresh
    end
  end

  class Jeweler
    def version_helper
      Ichabod::Version
    end

    def version_exists?
      true
    end
  end

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "ichabod"
    gemspec.summary = "Ichabod wraps JavaScript in a loving MacRuby embrace."
    gemspec.homepage = "http://github.com/maccman/ichabod"
    gemspec.description = "Ichabod wraps JavaScript in a loving MacRuby embrace."
    gemspec.license = "MIT"
    gemspec.email = "info@eribium.org"
    gemspec.authors = ["Alex MacCaw"]
    gemspec.has_rdoc = false
  end
rescue LoadError
  puts "Jeweler not available."
  puts "Install it with: gem install jeweler"
end
