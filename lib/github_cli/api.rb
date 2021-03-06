# encoding: utf-8

module GithubCLI
  # The API class is the main entry point for creating GithubCLI APIs.
  class API

    ENDPOINT = ''

    @@api = nil

    class << self

      attr_reader :config

      def github_api
        @@api ||= begin
          @@api = configure_api
        end
      end

      def configure_api
        @@api = Github.new
        @@api.oauth_token = GithubCLI.config['auth.token']
        @@api.basic_auth  = GithubCLI.config['auth.basic']
        @@api.endpoint    = GithubCLI.config['core.endpoint'] || @@api.endpoint
        if ENV['TEST_HOST']
          @@api.endpoint = 'http://' + ENV['TEST_HOST']
        end
        @@api
      end

      def output(format=:table, &block)
        response =  block.call
        formatter = Formatter.new response, :format => format
        formatter.render_output
      end

    end

    class All
      def initialize(params)
        puts Github::Repos.new.all params
      end
    end

  end # API
end # GithubCLI
