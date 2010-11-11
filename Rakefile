require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the authorization plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the authorization plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Authorization'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.txt')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "authorization"
    gem.summary = "Authoization plugin for authorizing."
    gem.files = Dir["*", "{lib}/**/*","{generators}/**/*","{tasks}/**/*","{doc}/**/*"]
#    gem.require_paths=["lib"]
    gem.author="Bill Katz"
    gem.homepage="https://github.com/g5search/rails-authorization-plugin"
    gem.description="Rails 3 compatible rails-authorization-plugin gem"
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end