require 'rspec/core/rake_task'
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "isociate/spp/version"

task :default => :spec

task :build do
  system "gem build isociate-spp.gemspec"
end

task :release => :build do
  system "gem push isociate-spp-#{Isociate::Spp::VERSION}"
end
