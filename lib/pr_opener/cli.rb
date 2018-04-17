require 'thor'
require 'pr_opener/opener'

module PROpener
  class CLI < Thor
    def initialize(*args, &block)
      super
      @github_client = ENV['TEST'] ? MockGithubClient.new(ENV) : GithubClient.new(ENV)
    end

    desc 'open BRANCH', 'Open a PR for the specified branch'
    def open(branch)
      Opener.new(@github_client, branch, $stdout).open
    end
  end

  class MockGithubClient
    def initialize(env)
      @env = env
    end
  end
end
