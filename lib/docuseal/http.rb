# frozen_string_literal: true

require 'json'
require 'cgi'
require 'uri'
require 'net/http'

module Docuseal
  class Http
    BODY_METHODS = %i[post put].freeze

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def get(path, params = {})
      send_request(:get, path, params)
    end

    def post(path, body = {})
      send_request(:post, path, {}, body)
    end

    def put(path, body = {})
      send_request(:put, path, {}, body)
    end

    def delete(path, params = {})
      send_request(:delete, path, params)
    end

    private

    def send_request(method, path, params = {}, body = {})
      uri = URI.parse(config[:url] + path)

      path = uri.path + to_query(params)

      resp =
        if BODY_METHODS.include?(method)
          conn(uri).public_send(method, path, body.to_json, headers)
        else
          conn(uri).public_send(method, path, headers)
        end

      handle_response(resp)
    end

    def headers
      {
        'X-Auth-Token' => config[:key],
        'Content-Type' => 'application/json'
      }
    end

    def to_query(params)
      return '' if params.empty?

      "?#{params.map { |key, value| "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}" }.join('&')}"
    end

    def conn(uri)
      conn = Net::HTTP.new(uri.host, uri.port)

      conn.read_timeout = config[:read_timeout]
      conn.open_timeout = config[:open_timeout]

      conn.use_ssl = uri.scheme == 'https'

      conn
    end

    def handle_response(response)
      case response.code.to_i
      when 200..299
        JSON.parse(response.body)
      else
        raise Api::Error, "API Error #{response.code}: #{response.body}"
      end
    end
  end
end
