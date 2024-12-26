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

    def_delegators :api, *Docuseal::Api.instance_methods(false)

    def_delegators :config,
                   *Docuseal::Configuration.members,
                   *Docuseal::Configuration.members.map { |name| :"#{name}=" }

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
