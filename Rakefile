require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :cucumber do
  puts `cucumber`
end
task :default => [:spec, :cucumber]
