# noinspection RubyResolve,RubyResolve
require_relative '../test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

require_solution 'HLO'

class ClientTest < Minitest::Test

  def test_hello
    assert_equal "Hello, John!", HelloSolution.new.hello("John"), 'App should say hello to John'
    assert_equal "Hello, Jane!", HelloSolution.new.hello("Jane"), 'App should say hello to Jane'
  end

end
