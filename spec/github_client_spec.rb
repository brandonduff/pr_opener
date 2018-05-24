require 'pr_opener/github_client'
require 'vcr_helper'

RSpec.describe PROpener::GithubClient do
  subject { described_class.new(open_configuration) }
  let(:open_configuration) do
    OpenStruct.new(
      title: 'test_branch',
      branch: 'test_branch',
      repo: 'brandonduff/pr_opener',
      base: 'master',
    )
  end

  describe '#open' do
    context 'when given an existing branch' do
      around do |example|
        VCR.use_cassette('open') do
          example.run
        end
      end

      it 'opens to master with the branch name as a title by default' do
        expect(subject.open('test_branch')).to be_successful
      end
    end

    context 'when the branch does not exist' do
      around do |example|
        VCR.use_cassette('opening_with_bad_branch') do
          example.run
        end
      end

      it 'reports as unsuccessful' do
        expect(subject.open('non_existent_branch')).to_not be_successful
      end
    end
  end
end
