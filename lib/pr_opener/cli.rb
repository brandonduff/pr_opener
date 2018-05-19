require 'thor'
require 'pr_opener/opener'
require 'ostruct'

module PROpener
  class CLI < Thor
    def initialize(*args, &block)
      super
      @github_client = GithubClient.new(OpenConfiguration.new)
    end

    desc 'open BRANCH', 'Open a PR for the specified branch'
    def open(branch)
      Opener.new(@github_client, branch, $stdout).open
    end
  end

  class OpenConfiguration
    def self.new
      OpenStruct.new(
        title: 'test_branch',
        branch: 'test_branch',
        repo: 'brandonduff/pr_opener',
        base: 'master',
      )
    end
  end

  class MockGithubClient
    def initialize(env)
      @env = env
    end
  end
end
