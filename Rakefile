require 'rake'
require 'simhash'

desc 'Default: run unit tests.'
task :default => [:test]

Rake::ExtensionTask.new('string_hashing')


desc 'Start an IRB session with all necessary files required.'
task :shell do |t|
  chdir File.dirname(__FILE__)
  exec 'irb -I lib/ -I lib/simhash -I lib/string -I lib/integer -r rubygems'
end

desc 'Build the gemspec.'
task :gemspec do |t|
  exec 'gem build simhash.gemspec'
end

desc "Print a list of the files to be put into the gem"
task :manifest do
  spec.files.each do |file|
    puts file
  end
end

desc "Generate a gemspec file for GitHub"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end

desc "Build the gem into the current directory"
task :gem => :gemspec do
  `gem build #{spec.name}.gemspec`
end
