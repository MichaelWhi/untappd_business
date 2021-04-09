require_relative 'lib/untappd/version'

Gem::Specification.new do |spec|
  spec.name          = "untappd_business"
  spec.version       = UntappdBusiness::VERSION
  spec.authors       = ["Michael Whittaker"]
  spec.email         = ["post@michael-whittaker.de"]

  spec.summary       = %q{A very simple gem that gives you a ruby class to fetch menu items from an untapped menu.}
  spec.homepage      = "https://github.com/MichaelWhi/untappd_business"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MichaelWhi/untappd_business"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # gems needed:
  spec.add_dependency "httparty"
  spec.add_dependency "thor"
end
