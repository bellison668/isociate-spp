require 'rspec/autorun'
require 'simplecov'

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'isociate'

SimpleCov.start
