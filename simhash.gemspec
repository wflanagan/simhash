require 'rubygems'
require 'rake'

spec = Gem::Specification.new do |s|
  s.name              = "simhash"
  s.version           = "0.2.3"
  s.author            = "Alex Gusev"
  s.email             = "alex.gusev@bookmate.ru"
  s.homepage          = "http://github.com/wflanagan/simhash"
  s.rubyforge_project = "simhash"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Gives you possbility to convert string into simhashes to futher use: finding near-duplicates, similar strings, etc."
  s.files             = [
                          "simhash.gemspec",
                          "README.rdoc",
                          "Rakefile",
                          "LICENSE",
                          "ext/string_hashing/extconf.rb",
                          "ext/string_hashing/string_hashing.c",
                          "lib/integer.rb",
                          "lib/simhash.rb",
                          "lib/string.rb",
                          "lib/simhash/stopwords.rb",
                          "lib/simhash/stopwords/en.rb",
                          "lib/simhash/stopwords/ru.rb",
                          "test/helper.rb",
                          "test/integer_test.rb",
                          "test/simhash_test.rb",
                          "test/string_test.rb" ]
  s.require_paths      = ["lib"]
  s.test_files        = ["test/helper.rb",
                          "test/integer_test.rb",
                          "test/simhash_test.rb",
                          "test/string_test.rb" ]
  s.extensions        = ["ext/string_hashing/extconf.rb"] 
  
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<unicode>, [">= 0.3.1"])
      s.add_runtime_dependency(%q<activesupport>)      
    else
      s.add_dependency(%q<unicode>, [">= 0.3.1"])
      s.add_dependency(%q<activesupport>)
    end
  else
    s.add_dependency(%q<unicode>, [">= 0.3.1"])
    s.add_dependency(%q<activesupport>)
  end
end

Rake::GemPackageTask.new(spec) do |pkg|
end

Rake::ExtensionTask.new('string_hashing', spec)
