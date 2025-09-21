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

  def test_checkout_multiple_items
    assert_equal 80, CheckoutSolution.new.checkout('AB'), 'Should return 80 for AB'
    assert_equal 35, CheckoutSolution.new.checkout('CD'), 'Should return 35 for CD'
  end

  def test_checkout_special_offers
    assert_equal 130, CheckoutSolution.new.checkout('AAA'), 'Should return 130 for AAA'
    assert_equal 180, CheckoutSolution.new.checkout('AAAA'), 'Should return 180 for AAAA'
    assert_equal 45, CheckoutSolution.new.checkout('BB'), 'Should return 45 for BB'
    assert_equal 75, CheckoutSolution.new.checkout('BBB'), 'Should return 75 for BBB'
  end

  def test_checkout_mixed_offers
    assert_equal 175, CheckoutSolution.new.checkout('AAABB'), 'Should return 175 for AAABB'
  end
end
