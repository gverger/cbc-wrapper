# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbc-wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "cbc-wrapper"
  spec.version       = CbcWrapper::VERSION
  spec.authors       = ["Guillaume Verger"]
  spec.email         = ["verger.guillaume@gmail.com"]

  spec.summary       = "Bare wrapper around Cbc Linear Programming Solver made with SWIG"
  spec.description   = "Bare wrapper around Cbc Linear Programming Solver made with SWIG"
  spec.homepage      = "https://github.com/gverger/cbc-wrapper"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "ext"]
  spec.extensions    << "ext/cbc-wrapper/extconf.rb"

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake-compiler"
end
