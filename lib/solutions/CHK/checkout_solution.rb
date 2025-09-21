# noinspection RubyUnusedLocalVariable
class CheckoutSolution
  PRICES = {
    'A' => 50,
    'B' => 30,
    'C' => 20,
    'D' => 15,
    'E' => 40,
    'F' => 10,
    'G' => 20,
    'H' => 10,
    'I' => 35,
    'J' => 60,
    'K' => 70,
    'L' => 90,
    'M' => 15,
    'N' => 40,
    'O' => 10,
    'P' => 50,
    'Q' => 30,
    'R' => 50,
    'S' => 20,
    'T' => 20,
    'U' => 40,
    'V' => 50,
    'W' => 20,
    'X' => 17,
    'Y' => 20,
    'Z' => 21
  }.freeze

  OFFERS = {
    'A' => [{count: 3, price: 130}, {count: 5, price: 200}],
    'B' => [{count: 2, price: 45}],
    'H' => [{count: 5, price: 45}, {count: 10, price: 80}],
    'K' => [{count: 2, price: 120}],
    'P' => [{count: 5, price: 200}],
    'Q' => [{count: 3, price: 80}],
    'V' => [{count: 2, price: 90}, {count:3, price: 130}],
  }.freeze

  FREE_ITEM_OFFERS = {
    'E' => {count: 2, free_item: 'B'},
    'F' => {count: 3, free_item: 'F'},
    'N' => {count: 3, free_item: 'M'},
    'R' => {count: 3, free_item: 'Q'},
    'U' => {count: 4, free_item: 'U'},
  }.freeze

  GROUP_OFFERS = {
    items: ['S', 'T', 'X', 'Y', 'Z'],
    count: 3,
    price: 45
  }.freeze


  def checkout(skus)
    return -1 if skus.nil? || !skus.is_a?(String)

    item_counts = Hash.new(0)
    skus.each_char do |item|
      return -1 unless PRICES.key?(item)
      item_counts[item] += 1
    end

    total_price = 0

    _apply_free_item_offers(item_counts)
    total_price += _apply_group_offers(item_counts)
    total_price += _apply_quantity_offers(item_counts)
    
    item_counts.each do |item, count|
      total_price += PRICES[item] * count
    end

    total_price
  end

  private

  def _apply_free_item_offers(item_counts)
    FREE_ITEM_OFFERS.each do |item_sku, offer_details|
      offer_count = offer_details[:count]
      free_item_sku = offer_details[:free_item]

      num_times_offer_applies = item_counts[item_sku] / offer_count

      if item_sku == free_item_sku
        item_counts[free_item_sku] -= num_times_offer_applies
      else
        item_counts[free_item_sku] -= num_times_offer_applies if item_counts.key?(free_item_sku)
      end
      item_counts[free_item_sku] = [0, item_counts[free_item_sku]].max
    end
  end

  def _apply_group_offers(item_counts)
    current_offer_price = 0
    group_items = GROUP_OFFERS[:items]
    group_offer_count = GROUP_OFFERS[:count]
    group_offer_price = GROUP_OFFERS[:price]

    eligible_group_items = item_counts.select  { |item, count| group_items
                                      .include?(item) && count > 0}
                                      .flat_map{ |item, count| Array.new(count, item)}.sort_by{|item| PRICES[item]}

    while eligible_group_items.length >= group_offer_count
      items_for_offer = eligible_group_items.pop(group_offer_count)
      current_offer_price += group_offer_price
      items_for_offer.each { |item| item_counts[item] -= 1}
    end
    current_offer_price
  end

  def _apply_quantity_offers(item_counts)
    current_offer_price = 0
    OFFERS.each do |item_sku, offers|
      sorted_offers = offers.sort_by { |offer| -offer[:count] }

      sorted_offers.each do |offer_details|
        offer_count = offer_details[:count]
        offer_price = offer_details[:price]

        while item_counts[item_sku] >= offer_count
          current_offer_price += offer_price
          item_counts[item_sku] -= offer_count
        end
      end
    end
    current_offer_price
  end
end





