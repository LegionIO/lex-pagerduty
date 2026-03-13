# frozen_string_literal: true

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
  spec.homepage      = 'https://github.com/LegionIO/lex-pagerduty'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LegionIO/lex-pagerduty'
  spec.metadata['documentation_uri'] = 'https://github.com/LegionIO/lex-pagerduty'
  spec.metadata['changelog_uri'] = 'https://github.com/LegionIO/lex-pagerduty'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/LegionIO/lex-pagerduty/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'

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
