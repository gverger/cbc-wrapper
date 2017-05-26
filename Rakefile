require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rake/extensiontask'

def in_dir(path)
  original_dir = Dir.pwd
  Dir.chdir(path)
  yield
ensure
  Dir.chdir(original_dir)
end

SHARED_LIBRARY_EXTENSION = RUBY_PLATFORM.include?("darwin") ? 'bundle' : 'so'
EXTENSION = 'lib/cbc-wrapper/cbc_wrapper.'+SHARED_LIBRARY_EXTENSION

desc "Use extconf.rb and make to build the extension."
task :build_extension => EXTENSION

file EXTENSION => 'ext/cbc-wrapper/cbc_wrap.c' do
  in_dir('ext/cbc-wrapper') do
    system("ruby extconf.rb")
    system("make")
  end
end

CLEAN.include('ext/cbc-wrapper/Makefile', 'ext/cbc-wrapper/conftest.dSYM', 'ext/cbc-wrapper/mkmf.log', 'ext/cbc-wrapper/cbc_wrap.o')

task :default => [:build_extension, :spec]
