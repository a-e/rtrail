require 'simplecov'
SimpleCov.start if ENV['COVERAGE']
require 'coveralls'
Coveralls.wear!

PROJECT_ROOT = File.expand_path('..', File.dirname(__FILE__))
SPEC_DIR = File.join(PROJECT_ROOT, 'spec')
MOCK_APP_URL = "http://localhost:8080/index.php?/api/v2/"

$LOAD_PATH.unshift(File.join(PROJECT_ROOT, 'lib'))
require 'rtrail'

# Require all .rb files in spec/support
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

module SpecHelpers
end

RSpec.configure do |config|
  config.include SpecHelpers
  config.before(:all) do
    RTrail::Entity.client = RTrail::Client.new(MOCK_APP_URL, 'user', 'password')
  end
end

