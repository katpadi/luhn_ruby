# frozen_string_literal: true

require_relative "lib/luhn/version"

Gem::Specification.new do |spec|
  spec.name = "luhn_util"
  spec.version = Luhn::VERSION
  spec.authors = ["Kat Padilla"]
  spec.email = ["hello@katpadi.ph"]
  spec.summary = "A simple Luhn algorithm implementation using Ruby."
  spec.description = "A simple Ruby utility to validate and generate Luhn-compliant numbers"
  spec.homepage = 'https://rubygems.org/gems/luhn_util'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/katpadi/luhn_util'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end
