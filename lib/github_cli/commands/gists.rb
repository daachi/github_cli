# encoding: utf-8

module GithubCLI
  class Commands::Gists < Command

    namespace :gist

    desc 'list', 'List all gists'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'List a <user> gists',
                  :banner => '<user>'
    method_option :starred, :type => :boolean, :aliases => ["-s"],
                  :default => false,
                  :desc => 'List the authenticated users starred gists'
    def list
      if options[:starred]
        Gist.starred options[:params], options[:format]
      else
        if options[:user]
          options[:params]['user'] = options[:user]
        end
        Gist.all options[:params], options[:format]
      end
    end

    desc 'get <id>', 'Get a single gist'
    def get(id)
      Gist.get id, options[:params], options[:format]
    end

    desc 'create', 'Create a gist'
    long_desc <<-DESC
      Create a gist

      Parameters

        description - Optional string\n
        public  - Required boolean\n
        files - Required hash - Files that make up this gist. The key of which should be a required string filename and the value another required hash with parameters: \n
          content - Required string - File contents.
    DESC
    def create
      Gist.create options[:params], options[:format]
    end

    desc 'edit <id>', 'Edit a gist'
    long_desc <<-DESC
      Edit a gist

      Parameters

        description - Optional string\n
        files - Optional hash - Files that make up this gist. The key of which should be a optional string filename and the value another optional hash with parameters: \n
          content - Updated string - Update file contents.\n
          filename - Optional string - New name for this file.\n
    DESC
    def edit(id)
      Gist.edit id, options[:params], options[:format]
    end

    desc 'star <id>', 'Star a gist'
    def star(id)
      Gist.star id, options[:params], options[:format]
    end

    desc 'unstar <id>', 'Unstar a gist'
    def unstar(id)
      Gist.unstar id, options[:params], options[:format]
    end

    desc 'starred <id>', 'Check if a gist is starred'
    def starred(id)
      Gist.starred? id, options[:params], options[:format]
    end

    desc 'fork <id>', 'Fork a gist'
    def fork(id)
      Gist.fork id, options[:params], options[:format]
    end

    desc 'delete <id>', 'Delete a gist'
    def delete(id)
      Gist.delete id, options[:params], options[:format]
    end

  end # Gists
end # GithubCLI
