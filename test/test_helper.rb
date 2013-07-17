<<<<<<< HEAD
ENV["RAILS_ENV"] = "test"
=======
ENV["RAILS_ENV"] ||= "test"
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
<<<<<<< HEAD
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
=======
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
