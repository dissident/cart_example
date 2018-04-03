require './lib/item'

describe Item do
  describe ' #validate' do
    it 'raise validation error if name or price are nil' do
      expect { Item.new }.to raise_error(
        ValidationError,
        'Validation error, next fields can\'t be blank: name, price'
      )
    end
  end

  describe ' #tax' do
    context 'book' do
      let(:item) do
        Item.new({
          name: 'book',
          price: 12.49,
          exempted: true
        })
      end
      it 'return 0' do
        expect(item.tax(1)).to eq(0)
      end
    end

    context 'imported book' do
      let(:item) do
        Item.new({
          name: 'imported book',
          price: 12.49,
          exempted: true,
          imported: true
        })
      end
      it 'return 0.6' do
        expect(item.tax(1)).to eq(0.6)
      end
    end
  end
end
