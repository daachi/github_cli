# encoding: utf-8

module GithubCLI
  module Formatters
    class CSV

      def initialize(response)
        @response = response
      end

      def format
        case @response
        when Array
          render_headers @response.first
          @response.each_with_index do |item, indx|
            render_line indx, item
            Terminal.newline
          end
        when Hash
          render_headers @response
          render_line 1, @response
        else
          Terminal.line "#{@response}\n"
        end
      end

      def render_headers(response)
        output = GithubCLI::Util.flatten_hash(response.to_hash)
        Terminal.line "Index,#{output.keys.join(',')}\n"
      end

      def render_line(index, item)
        output = GithubCLI::Util.flatten_hash(item.to_hash)
        $stdout.printf "%d,%s", index, output.values.join(',')
      end

    end # CSV
  end # Formatters
end # GithubCLI
