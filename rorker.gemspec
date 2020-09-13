# frozen_string_literal: true

require_relative "lib/rorker/version"

Gem::Specification.new do |spec|
  spec.name          = "rorker"
  spec.version       = Rorker::VERSION
  spec.authors       = ["S-H-GAMELINKS"]
  spec.email         = ["gamelinks007@gmail.com"]

  spec.summary       = "Ractor workers gem"
  spec.description   = "More easy create Ractor worker"
  spec.homepage      = "https://github.com/S-H-GAMELINKS/rorker"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/S-H-GAMELINKS/rorker"
  spec.metadata["changelog_uri"] = "https://github.com/S-H-GAMELINKS/rorker"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
