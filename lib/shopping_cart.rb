class ShoppingCart
  attr_reader :items, :tax_calculator, :receipt

  def initialize(items, tax_calculator, receipt)
    @items = items
    @tax_calculator = tax_calculator
    @receipt = receipt
  end

  def purchase_items
    total_sales_tax = 0
    items_price_inclusive_of_taxes = []

    items.each do |item|
      item_details = item.details
      
      price_inclusive_of_tax, total_tax = tax_calculator.calculate_tax(item_details.reject { |k,v| k == :quantity})
      total_sales_tax += calculate_sales_tax(total_tax, item_details[:quantity])
      total_item_cost = calculate_total_price(price_inclusive_of_tax, item_details[:quantity])

      items_price_inclusive_of_taxes << LineItem.new(item_details[:name], total_item_cost, item_details[:quantity])
    end

    receipt.generate(items_price_inclusive_of_taxes, total_sales_tax)
  end

  private

  def calculate_sales_tax(total_tax, quantity)
    total_tax * quantity
  end

  def calculate_total_price(price, quantity)
    price * quantity
  end
end
