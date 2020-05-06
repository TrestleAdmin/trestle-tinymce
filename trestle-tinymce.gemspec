require_relative "lib/trestle/tinymce/version"

Gem::Specification.new do |spec|
  spec.name          = "trestle-tinymce"
  spec.version       = Trestle::TinyMCE::VERSION

  spec.authors       = ["Sam Pohlenz"]
  spec.email         = ["sam@sampohlenz.com"]

  spec.summary       = "TinyMCE integration plugin for the Trestle admin framework"
  spec.description   = "TinyMCE integration plugin for the Trestle admin framework."
  spec.homepage      = "https://www.trestle.io"
  spec.license       = "LGPL-3.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "trestle",       "~> 0.9.0"
  spec.add_dependency "tinymce-rails", "~> 5.1"
end
