# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'isociate/spp/version'
 
Gem::Specification.new do |s|
  s.name        = "isociate-spp"
  s.version     = Isociate::Spp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adam Strickland", "Brian Ellison"]
  s.email       = ["adam@molecule.io"]
  s.homepage    = "http://github.com/wearemolecule/isociate-spp"
  s.summary     = "An ISO connector for SPP's nodal market"
  s.description = "ISO Connectivity is a pain.  Isociate makes it less of one"
  # s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "rspec"
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.require_path = 'lib'
end
