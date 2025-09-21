# noinspection RubyUnusedLocalVariable
class CheckoutSolution
  PRICES = {
    'A' => 50,
    'B' => 30,
    'C' => 20,
    'D' => 15
  }.freeze


  def checkout(skus)
    return -1 if skus.nil? || !skus.is_a?(String)

    total = 0

    skus.each_char do |item|
      return -1 unless PRICES.key?(item)
      total += PRICES[item]
    end

    return total
  end

end



