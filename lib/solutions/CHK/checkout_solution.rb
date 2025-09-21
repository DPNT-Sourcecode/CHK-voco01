# noinspection RubyUnusedLocalVariable
class CheckoutSolution
  PRICES = {
    'A' => 50,
    'B' => 30,
    'C' => 20,
    'D' => 15
  }.freeze

  OFFERS = {
    'A' => {count: 3, price: 130},
    'B' => {count: 2, price: 45}
  }


  def checkout(skus)
    return -1 if skus.nil? || !skus.is_a?(String)

    item_counts = Hash.new(0)
    skus.each_char do |item|
      return -1 unless PRICES.key?(item)
      item_counts[item] += 1
    end

    total_price = 0

    if item_counts.key?('A')
      num_a = item_counts['A']
      offer_a_count = OFFERS['A'][:count]
      offer_a_price = OFFERS['A'][:price]

      num_offers_a = num_a / offer_a_count
      total_price += num_offers_a * offer_a_price
      item_counts['A'] %= offer_a_count
    end

    item_counts.each do |item, count|
      total_price += PRICES[item] * count
    end

    return total_price
  end

end
