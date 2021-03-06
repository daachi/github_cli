# encoding: utf-8

module GithubCLI
  class Reference < API

    class << self

      def list(user, repo, params, format)
        output format do
          github_api.git_data.references.list user, repo, params
        end
      end

      def get(user, repo, ref, params, format)
        output format do
          github_api.git_data.references.get user, repo, ref, params
        end
      end

      def create(user, repo, params, format)
        output format do
          github_api.git_data.references.create user, repo, params
        end
      end

      def update(user, repo, ref, params, format)
        output format do
          github_api.git_data.references.update user, repo, ref, params
        end
      end

      def delete(user, repo, ref, params, format)
        output format do
          github_api.git_data.references.delete user, repo, ref, params
        end
      end
    end

  end # Reference
end # GithubCLI
