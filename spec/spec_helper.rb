require 'rubygems'
require 'bundler/setup'
Bundler.require


RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end

RSpec::Matchers.define :be_converted_successfully do
  match do |conversion_response|
    conversion_response[:status] == 'ok' && File.exist?(conversion_response[:pdf_path]) && File.exist?(conversion_response[:swf_path]) && File.exist?(conversion_response[:cover_path])
  end
end
