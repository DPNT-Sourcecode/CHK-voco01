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
    assert_equal 40, CheckoutSolution.new.checkout('E'), 'Should return 40 for E'
    assert_equal 10, CheckoutSolution.new.checkout('F'), 'Should return 10 for F'
    assert_equal 20, CheckoutSolution.new.checkout('G'), 'Should return 20 for G'
    assert_equal 10, CheckoutSolution.new.checkout('H'), 'Should return 10 for H'
    assert_equal 35, CheckoutSolution.new.checkout('I'), 'Should return 35 for I'
    assert_equal 60, CheckoutSolution.new.checkout('J'), 'Should return 60 for J'
    assert_equal 70, CheckoutSolution.new.checkout('K'), 'Should return 70 for K'
    assert_equal 90, CheckoutSolution.new.checkout('L'), 'Should return 90 for L'
    assert_equal 15, CheckoutSolution.new.checkout('M'), 'Should return 15 for M'
    assert_equal 40, CheckoutSolution.new.checkout('N'), 'Should return 40 for N'
    assert_equal 10, CheckoutSolution.new.checkout('O'), 'Should return 10 for O'
    assert_equal 50, CheckoutSolution.new.checkout('P'), 'Should return 50 for P'
    assert_equal 30, CheckoutSolution.new.checkout('Q'), 'Should return 30 for Q'
    assert_equal 50, CheckoutSolution.new.checkout('R'), 'Should return 50 for R'
    assert_equal 20, CheckoutSolution.new.checkout('S'), 'Should return 20 for S'
    assert_equal 20, CheckoutSolution.new.checkout('T'), 'Should return 20 for T'
    assert_equal 40, CheckoutSolution.new.checkout('U'), 'Should return 40 for U'
    assert_equal 50, CheckoutSolution.new.checkout('V'), 'Should return 50 for V'
    assert_equal 20, CheckoutSolution.new.checkout('W'), 'Should return 20 for W'
    assert_equal 17, CheckoutSolution.new.checkout('X'), 'Should return 17 for X'
    assert_equal 20, CheckoutSolution.new.checkout('Y'), 'Should return 20 for Y'
    assert_equal 21, CheckoutSolution.new.checkout('Z'), 'Should return 21 for Z'
  end

  def test_checkout_multiple_items
    assert_equal 80, CheckoutSolution.new.checkout('AB'), 'Should return 80 for AB'
    assert_equal 35, CheckoutSolution.new.checkout('CD'), 'Should return 35 for CD'
    assert_equal 80, CheckoutSolution.new.checkout('EE'), 'Should return 80 for EE'
    assert_equal 20, CheckoutSolution.new.checkout('FF'), 'Should return 20 for FF'
  end

  def test_checkout_special_offers
    assert_equal 130, CheckoutSolution.new.checkout('AAA'), 'Should return 130 for AAA'
    assert_equal 180, CheckoutSolution.new.checkout('AAAA'), 'Should return 180 for AAAA'
    assert_equal 200, CheckoutSolution.new.checkout('AAAAA'), 'Should return 200 for AAAAA'
    assert_equal 45, CheckoutSolution.new.checkout('BB'), 'Should return 45 for BB'
    assert_equal 75, CheckoutSolution.new.checkout('BBB'), 'Should return 75 for BBB'
    assert_equal 80, CheckoutSolution.new.checkout('EEB'), 'Should return 80 for EEB'
    assert_equal 20, CheckoutSolution.new.checkout('FF'), 'Should return 20 for FFF'
    assert_equal 20, CheckoutSolution.new.checkout('FFF'), 'Should return 30 for FFF'
    assert_equal 45, CheckoutSolution.new.checkout('HHHHH'), 'Should return 45 for HHHHH'
    assert_equal 80, CheckoutSolution.new.checkout('HHHHHHHHHH'), 'Should return 80 for HHHHHHHHHH'
    assert_equal 120, CheckoutSolution.new.checkout('KK'), 'Should return 120 for KK'
    assert_equal 120, CheckoutSolution.new.checkout('NNN'), 'Should return 120 for NNN'
    assert_equal 120, CheckoutSolution.new.checkout('NNNM'), 'Should return 120 for NNNM'
    assert_equal 200, CheckoutSolution.new.checkout('PPPPP'), 'Should return 200 for PPPPP'
    assert_equal 80, CheckoutSolution.new.checkout('QQQ'), 'Should return 80 for QQQ'
    assert_equal 150, CheckoutSolution.new.checkout('RRR'), 'Should return 150 for RRR'
    assert_equal 150, CheckoutSolution.new.checkout('RRRQ'), 'Should return 150 for RRRQ'
    assert_equal 120, CheckoutSolution.new.checkout('UUU'), 'Should return 120 for UUU'
    assert_equal 120, CheckoutSolution.new.checkout('UUUU'), 'Should return 120 for UUUU'
    assert_equal 90, CheckoutSolution.new.checkout('VV'), 'Should return 90 for VV'
    assert_equal 130, CheckoutSolution.new.checkout('VVV'), 'Should return 130 for VVV'
  end

  def test_checkout_mixed_offers
    assert_equal 175, CheckoutSolution.new.checkout('AAABB'), 'Should return 175 for AAABB'
    assert_equal 275, CheckoutSolution.new.checkout('AAAABBCDD'), 'Should return 275 for AAAABBCDD'
    assert_equal 280, CheckoutSolution.new.checkout('AAAAABEE'), 'Should return 280 for AAAAABEE'
    assert_equal 280, CheckoutSolution.new.checkout('AAAAAEE'), 'Should return 280 for AAAAABEE'
    assert_equal 45, CheckoutSolution.new.checkout('STX'), 'Should return 45 for STX'
  end
end
