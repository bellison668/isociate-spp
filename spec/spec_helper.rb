require 'rspec/autorun'
require 'simplecov'

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'isociate'

# require $:.unshift(File.expand_path('./support/**/*', __FILE__))
Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each {|f| require f}

SimpleCov.start
