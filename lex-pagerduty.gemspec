require_relative 'lib/legion/extensions/pagerduty/version'

Gem::Specification.new do |spec|
  spec.name          = 'legion-extensions-pagerduty'
  spec.version       = Legion::Extensions::Pagerduty::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'Legion::Extensions::Pagerduty'
  spec.description   = 'Connects Legion to Pagerduty, WIP'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-pagerduty/src'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-pagerduty'
  spec.metadata['changelog_uri'] = 'https://bitbucket.org/legion-io/lex-pagerduty/src'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-md'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'

  spec.add_dependency 'pagerduty', '>= 3.0.0'
end
