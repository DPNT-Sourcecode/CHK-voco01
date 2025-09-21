# noinspection RubyResolve,RubyResolve
require_relative '../test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

require_solution 'HLO'

class ClientTest < Minitest::Test

  def test_hello
    assert_equal "Hello, World!", HelloSolution.new.hello("John"), 'App should say hello to the World regardless of the name'
  end

end

