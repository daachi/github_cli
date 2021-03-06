# encoding: utf-8

module GithubCLI
  class Commands::Watching < Command

    namespace :watch

    desc 'list <user> <repo>', 'Lists repo watchers'
    def list(user, repo)
      Watching.list user, repo, options[:params], options[:format]
    end

    desc 'watched', 'Lists repos being watched by a user'
    method_option :user, :type => :string, :aliases => ["-u"],
                  :desc => 'Watch repositories for <user>'
    def watched
      if options[:user]
        options[:params]['user'] = options[:user]
      end
      Watching.watched options[:params], options[:format]
    end

    desc 'watching <user> <repo>', 'Check if you are watching a repository'
    def watching(user, repo)
      Watching.watching? user, repo, options[:params], options[:format]
    end

    desc 'start <user> <repo>', 'Watch a repository'
    def start(user, repo)
      Watching.start user, repo, options[:params], options[:format]
    end

    desc 'stop <user> <repo>', 'Stop watching a repository'
    def stop(user, repo)
      Watching.stop user, repo, options[:params], options[:format]
    end

  end # Watching
end # GithubCLI
