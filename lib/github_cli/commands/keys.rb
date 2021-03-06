# encoding: utf-8

module GithubCLI
  class Commands::Keys < Command

    namespace :key

    desc 'list <user> <repo>', 'Lists keys'
    def list(user, repo)
      Key.all user, repo, options[:params], options[:format]
    end

    desc 'get <user> <repo> <id>', 'Get a key'
    def get(user, repo, id)
      Key.get user, repo, id, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a new key'
    long_desc <<-DESC
      Inputs

      title - Required string. \n
      key - Required string.
    DESC
    def create(user, repo)
      Key.create user, repo, options[:params], options[:format]
    end

    desc 'edit <user> <repo> <id>', 'Edit a key'
    long_desc <<-DESC
      Inputs

      title - Required string. \n
      key - Required string.
    DESC
    def edit(user, repo, id)
      Key.edit user, repo, id, options[:params], options[:format]
    end

    desc 'delete <user> <repo> <id>', 'Delete a key'
    def delete(user, repo, id)
      Key.delete user, repo, id, options[:params], options[:format]
    end

  end # Keys
end # GithubCLI
