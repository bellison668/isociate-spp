require 'rbconfig'

lin_options='--colour --profile --order rand:3412'
win_options='--profile --order rand:3412'
options=if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
	win_options
else
	lin_options
end

guard :rspec, :cli => '--colour --profile --order rand:3412', :all_on_start => false, :all_after_pass => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
