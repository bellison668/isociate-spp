source 'https://rubygems.org'
ruby '1.9.3'

gem 'rake'
gem 'savon', '~> 2.0'

group :test do
  gem 'rspec'
  gem 'simplecov', :require => false, :group => :test
  require 'rbconfig'
  gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
  gem 'guard-rspec'
end
