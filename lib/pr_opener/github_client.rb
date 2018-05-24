require 'octokit'

module PROpener
  class GithubClient
    extend Forwardable
    def_delegators :@open_configuration, :repo, :base, :branch, :title

    def initialize(open_configuration)
      @open_configuration = open_configuration
    end

    def open(branch)
      self.last_response = octokit.create_pull_request(repo, base, branch, title)
      self
    rescue
      self.last_response = OpenStruct.new(state: 'failed')
      self
    end

    def successful?
      last_response.state == 'open'
    end

    private

    def octokit
      @octokit ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    end

    attr_accessor :last_response
  end
end
