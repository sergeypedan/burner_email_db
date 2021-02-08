# frozen_string_literal: true

# For more information and examples about making a new gem, checkout guide at: https://bundler.io/guides/creating_gem.html

require_relative "lib/burner_email_db/version"

Gem::Specification.new do |spec|
  spec.authors     = ["Sergey Pedan", "Wes Bos"]
  spec.summary     =  "DB of burner email domains"
  spec.description =  "#{spec.summary}. Use as one of the steps in your email validations."
  spec.email       = ["sergey.pedan@gmail.com"]
  spec.homepage    =  "https://github.com/sergeypedan/burner_email_db"
  spec.license     =  "MIT"
  spec.name        =  "burner_email_db"
  spec.version     =   BurnerEmailDB::VERSION

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata = {
    "changelog_uri"     => "#{spec.homepage}/blob/master/Changelog.md",
    "documentation_uri" => "#{spec.homepage}#usage",
    "homepage_uri"      =>  spec.homepage,
    "source_code_uri"   =>  spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^#{spec.bindir}/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rake",  "~> 13"
  spec.add_development_dependency "rspec", "~> 3.10", "> 3.6"
end
