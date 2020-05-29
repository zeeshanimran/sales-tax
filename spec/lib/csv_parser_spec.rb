describe CsvParser do
  describe '#read' do
    context 'Selecting input CSV' do
      it 'Retuns line_items from CSV and strip spaces' do
        file_name = 'cart/2.csv'
        products = CsvParser.new(file_name).read

        line_items = [
          LineItem.new('imported box of chocolates', BigDecimal('10.00'), 1),
          LineItem.new('imported bottle of perfume', BigDecimal('47.50'), 1)
        ]
        expect(products.first.details).to eq(line_items.first.details)
      end
    end
  end
end
