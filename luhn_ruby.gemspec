# frozen_string_literal: true

require_relative "lib/luhn/version"

Gem::Specification.new do |spec|
  spec.name = "luhn_ruby"
  spec.version = Luhn::VERSION
  spec.authors = ["Kat Padilla"]
  spec.email = ["hello@katpadi.ph"]
  spec.summary = "A simple Luhn algorithm implementation using Ruby."
  spec.description = "A simple Luhn algorithm implementation using Ruby to validate and generate Luhn numbers"
  spec.homepage = 'https://rubygems.org/gems/luhn_ruby'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end
