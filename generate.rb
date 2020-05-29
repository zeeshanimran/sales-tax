require 'colorize'
require_relative './lib/csv_parser'
require_relative './lib/line_item'
require_relative './lib/shopping_cart'
require_relative './lib/receipt'
require_relative './lib/tax_calculator'

def get_cart
	puts "Please enter your bucket number [1 ,2, 3]: ".green
	input = gets.chomp
	file_name = "./cart/#{input}.csv"
	if File.exist?(file_name)
		generate_receipt file_name
	else
		puts "\n You've entered wrong input please try again".red
		get_cart
	end
end

def generate_receipt file_name
	line_items = CsvParser.new(file_name).read
	shopping_cart = ShoppingCart.new(line_items, TaxCalculator.new, Receipt.new)
	shopping_cart.purchase_items
end

get_cart