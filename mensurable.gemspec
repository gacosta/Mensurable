# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mensurable/version'

Gem::Specification.new do |spec|
  spec.name          = "mensurable"
  spec.version       = Mensurable::VERSION
  spec.authors       = ["Gianco Acosta"]
  spec.email         = ["gianco.acosta@icloud.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = %q{A simple gem to manage anything that can be measured.}
  spec.description   = %q{You can define, convert, scale, combine, and compare measures of physical magnitudes.}
  spec.homepage      = "https://github.com/gacosta/Mensurable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.7'
  spec.add_development_dependency "rake", '~> 10.4'
  spec.add_development_dependency "rspec", '~> 3.2'
  spec.add_development_dependency "coveralls", '~> 0.7'
end
