require "bundler/gem_tasks"

require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the hark gem'
Rake::TestTask.new(:test) do |t|
  t.libs << ['lib', 'test']
  t.pattern = 'test/**/test_*.rb'
  t.options = ["--verbose=verbose"] # (s[ilent], p[rogress], n[ormal], v[erbose])
end

desc "Generate documentation for the hark gem"
task :doc => ['doc:generate']

namespace :doc do

  project_root = File.expand_path(File.dirname(__FILE__))
  doc_destination = File.join(project_root, 'doc')

  begin
    require 'rdoc'
    require 'yard'
    require 'rdiscount'
    YARD::Rake::YardocTask.new(:generate) do |t|
      t.files = ['lib/**/*.rb']
      t.options = ['--output-dir', doc_destination, '--readme', 'README.md']
    end
  rescue LoadError
    desc "Generate YARD Documentation"
    task :generate do
      abort "Please install the yard and rdiscount gems to generate rdoc."
    end
  end

  desc "Remove generated documentation"
  task :clean do
    rm_r doc_destination if File.exists?(doc_destination)
  end

end
