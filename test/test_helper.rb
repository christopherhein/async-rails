ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  module Testing
    module SetupAndTeardown
      module ForMiniTest
        def run(runner)
          EventMachine.synchrony do
            result = '.'
            begin
              run_callbacks :setup do
                result = super
              end
            rescue Exception => e
              result = runner.puke(self.class, method_name, e)
            ensure
              begin
                run_callbacks :teardown
              rescue Exception => e
                result = runner.puke(self.class, method_name, e)
              end
            end
            result
            EventMachine.stop
          end
        end
      end
    end
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

end
