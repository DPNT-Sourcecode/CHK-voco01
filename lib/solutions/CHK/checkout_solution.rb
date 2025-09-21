# noinspection RubyUnusedLocalVariable
class CheckoutSolution
  PRICES = {
    'A' => 50,
    'B' => 30,
    'C' => 20,
    'D' => 15
  }


  def checkout(skus)
    return -1 if skus.nil? || !skus.is_a?(String)

    return PRICES[skus]
  end

end


