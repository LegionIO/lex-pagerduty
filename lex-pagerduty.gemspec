lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legion/extensions/pagerduty/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-pagerduty'
  spec.version       = Legion::Extensions::Pagerduty::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Pagerduty'
  spec.description   = 'LEX::Pagerduty'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-pagerduty'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-pagerduty'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/612270562'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/612270577'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-pagerduty/issues'

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'legionio'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'pagerduty'
end
