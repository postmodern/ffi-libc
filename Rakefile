require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:development, :doc)
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'rake/clean'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = 'ffi-libc'
  gem.licenses = ['MIT']
  gem.summary = %Q{Useful FFI bindings for libc}
  gem.email = 'postmodern.mod3@gmail.com'
  gem.homepage = %Q{http://github.com/postmodern/ffi-libc}
  gem.description = %Q{Useful Ruby FFI bindings for libc.}
  gem.authors = ['Postmodern']
  gem.has_rdoc = 'yard'
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
