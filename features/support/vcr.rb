require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "features/cassettes"
  config.hook_into :webmock
end

VCR.cucumber_tags do |t|
  t.tag  '@opening_cassette'
end
