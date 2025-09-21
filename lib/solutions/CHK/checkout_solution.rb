# noinspection RubyUnusedLocalVariable
class CheckoutSolution
  PRICES = {
    'A' => 50,
    'B' => 30,
    'C' => 20,
    'D' => 15,
    'E' => 40
  }.freeze

  OFFERS = {
    'A' => [{count: 3, price: 130}, {count: 5, price: 200}],
    'B' => {count: 2, price: 45}
  }.freeze

  FREE_ITEM_OFFERS = {
    'E' => {count: 2, free_item: 'B'}
  }.freeze


  def checkout(skus)
    return -1 if skus.nil? || !skus.is_a?(String)

    item_counts = Hash.new(0)
    skus.each_char do |item|
      return -1 unless PRICES.key?(item)
      item_counts[item] += 1
    end

    total_price = 0

    OFFERS.each do |item_sku, offer_details|
      while item_counts[item_sku] >= offer_details[:count]
        total_price += offer_details[:price]
        item_counts[item_sku] -= offer_details[:count]
      end
    end

    item_counts.each do |item, count|
      total_price += PRICES[item] * count
    end

    total_price
  end
end



