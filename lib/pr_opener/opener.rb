module PROpener
  class Opener
    def initialize(github_client, branch, logger)
      @github_client = github_client
      @branch = branch
      @logger = logger
    end

    def open
      if github_client.open(branch).successful?
        logger.puts 'PR Opened Successfully'
      end
    end

    private

    attr_reader :github_client, :branch, :logger
  end
end
