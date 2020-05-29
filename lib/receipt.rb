class Receipt
  def generate(items, total_sales_tax)
    total_cost = 0

    items.each do |item|
      details = item.details
      puts "#{details[:quantity]}, #{details[:name]}, #{big_decimal_to_float(details[:price])}\n"
      total_cost += details[:price]
    end

    puts "\nSales Taxes: #{big_decimal_to_float(total_sales_tax)}"
    puts "Total: #{big_decimal_to_float(total_cost)}"
  end

  private

  def big_decimal_to_float(number)
    '%.2f' % number
  end
end
