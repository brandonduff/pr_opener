require 'pr_opener'

RSpec.describe PROpener::Opener do
  subject { described_class.new(github_client, branch, logger) }
  let(:github_client) { double }
  let(:branch) { 'branch' }
  let(:logger) { double }

  it 'logs success' do
    expect(logger).to receive(:puts).with('PR Opened Successfully')
    subject.open
  end
end
