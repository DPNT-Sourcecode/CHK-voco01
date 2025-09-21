# noinspection RubyResolve,RubyResolve
require_relative '../test_helper'
require 'logging'

Logging.logger.root.appenders = Logging.appenders.stdout

require_solution 'CHK'

class ClientTest < Minitest::Test

  def test_checkout_individual_items
    assert_equal 50, CheckoutSolution.new.checkout('A'), 'Should return 50 for A'
    assert_equal 30, CheckoutSolution.new.checkout('B'), 'Should return 30 for B'
    assert_equal 20, CheckoutSolution.new.checkout('C'), 'Should return 20 for C'
    assert_equal 15, CheckoutSolution.new.checkout('D'), 'Should return 15 for D'
  end

end

