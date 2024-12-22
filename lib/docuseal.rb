# frozen_string_literal: true

module Docuseal
  autoload :VERSION, 'docuseal/version'
  autoload :Api, 'docuseal/api'
  autoload :Http, 'docuseal/http'

  DEFAULT_CONFIG = {
    url: 'https://api.docuseal.com',
    open_timeout: 60,
    read_timeout: 60
  }.freeze

  Configuration = Struct.new(:key,
                             :url,
                             :read_timeout,
                             :open_timeout, keyword_init: true)

  class << self
    require 'forwardable'

    extend Forwardable

    def_delegators :api,
                   :list_templates,
                   :get_template,
                   :create_template_from_docx,
                   :create_template_from_html,
                   :create_template_from_pdf,
                   :merge_templates,
                   :clone_template,
                   :update_template,
                   :update_template_documents,
                   :archive_template,
                   :permanently_delete_template,
                   :list_submissions,
                   :get_submission,
                   :create_submission,
                   :create_submission_from_emails,
                   :archive_submission,
                   :permanently_delete_submission,
                   :list_submitters,
                   :get_submitter,
                   :update_submitter

    def_delegators :config,
                   :key, :key=,
                   :url, :url=,
                   :open_timeout, :open_timeout=,
                   :read_timeout, :read_timeout=

    def config
      @config ||= Configuration.new(DEFAULT_CONFIG)
    end

    def setup
      config.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def api(config = nil)
      config = config ? DEFAULT_CONFIG.merge(config) : Docuseal.config

      Docuseal::Api.new(config)
    end
  end
end
