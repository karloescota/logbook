'#!'.freeze

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock # or :fakeweb
  config.filter_sensitive_data('<AWS_ACCESS_KEY_ID>') { ENV.fetch('AWS_ACCESS_KEY_ID') }
  config.ignore_localhost = true
end
