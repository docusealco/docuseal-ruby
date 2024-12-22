# frozen_string_literal: true

require_relative 'lib/docuseal/version'

Gem::Specification.new do |spec|
  spec.name = 'docuseal'
  spec.version = Docuseal::VERSION
  spec.authors = ['DocuSeal']
  spec.email = ['support@docuseal.com']
  spec.summary = 'Ruby bindings for DocuSeal API'
  spec.description = 'DocuSeal is a document signing platform. This gem provides a Ruby interface to the DocuSeal API.'
  spec.homepage = 'https://www.docuseal.com'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/docusealco/docuseal-ruby/issues',
    'homepage_uri' => 'https://www.docuseal.com',
    'source_code_uri' => 'https://github.com/docusealco/docuseal-ruby',
    'documentation_uri' => 'https://www.docuseal.com/docs/api',
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir[
    'lib/**/*',
    'LICENSE',
    'README.md'
  ]

  spec.require_paths = ['lib']
end
