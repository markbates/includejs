#!/usr/bin/env rake
require "bundler/gem_tasks"

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

task :default do
  system "jasmine-headless-webkit -c"
end

task :build do
  system "gem build includejs.gemspec"
end
