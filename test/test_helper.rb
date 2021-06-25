# SimpleCov
require 'simplecov'
SimpleCov.start do
  add_filter '/bin/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/public/'
  add_filter '/spec/'
  add_filter '/storage/'
  add_filter '/test/'
  add_filter '/vendor/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
end
# This outputs the report to your public folder
# You will want to add this to .gitignore
# SimpleCov.coverage_dir 'public/coverage'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'webdrivers/chromedriver'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Devise test helpers
  include Warden::Test::Helpers
  Warden.test_mode!
end

# Register the new driver for Capybara
Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu window-size=1400,900])
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :headless_chrome
