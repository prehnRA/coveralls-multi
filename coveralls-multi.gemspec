
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coveralls-multi/version'

Gem::Specification.new do |spec|
  spec.name          = 'coveralls-multi'
  spec.version       = CoverallsMulti::VERSION
  spec.authors       = ['CJ Horton']
  spec.email         = ['thecjhorton@gmail.com']

  spec.summary       = 'Coveralls support for multi-language repos.'
  spec.description   = 'Merges coverage files from multiple languages and test suites and pushes the merged file to Coveralls.'
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = 'coveralls-multi'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
