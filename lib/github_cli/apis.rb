if defined?(require_relative)
  def require_api(path)
    require_relative "apis/#{path}"
  end
else
  def require_api(path)
    require "github_cli/apis/#{path}"
  end
end

%w[
  assignee
  authorization
  blob
  collaborator
  commit
  content
  download
  email
  event
  follower
  fork
  gist
  hook
  issue
  key
  label
  member
  merging
  milestone
  organization
  pull_request
  reference
  repository
  search
  starring
  status
  tag
  team
  tree
  user
  watching
].each do |api|
  require_api api
end
