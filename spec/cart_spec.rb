require './lib/cart'
require './lib/item'

describe Cart do
  context 'input 1' do
    let(:cart) do
      cart = Cart.new
      item1 = Item.new({
        name: 'book',
        price: 12.49,
        exempted: true
      })
      item2 = Item.new({
        name: 'music CD',
        price: 14.99
      })
      item3 = Item.new({
        name: 'chocolate bar',
        price: 0.85,
        exempted: true
      })
      cart.add(item1, 1)
      cart.add(item2, 1)
      cart.add(item3, 1)
      cart
    end

    it 'total is 29.83' do
      expect(cart.total).to eq(29.83)
    end

    it 'sales_taxes is 1.50' do
      expect(cart.sales_taxes).to eq(1.5)
    end
  end

  context 'input 2' do
    let(:cart) do
      cart = Cart.new
      item1 = Item.new({
        name: ' imported box of chocolates',
        price: 10.00,
        exempted: true,
        imported: true
      })
      item2 = Item.new({
        name: 'imported bottle of perfume',
        price: 47.50,
        imported: true
      })
      cart.add(item1, 1)
      cart.add(item2, 1)
      cart
    end

    it 'total is 65.15' do
      expect(cart.total).to eq(65.15)
    end

    it 'sales_taxes is 7.65' do
      expect(cart.sales_taxes).to eq(7.65)
    end
  end

  context 'input 3' do
    let(:cart) do
      cart = Cart.new
      item0 = Item.new({
        name: 'imported bottle of perfume',
        price: 27.99,
        imported: true
      })
      item1 = Item.new({
        name: 'bottle of perfume',
        price: 18.99
      })
      item2 = Item.new({
        name: 'packet of headache pills',
        price: 9.75,
        exempted: true
      })
      item3 = Item.new({
        name: 'box of imported chocolatess',
        price: 11.25,
        exempted: true,
        imported: true
      })
      cart.add(item0, 1)
      cart.add(item1, 1)
      cart.add(item2, 1)
      cart.add(item3, 1)
      cart
    end

    it 'total is 74.68' do
      expect(cart.total).to eq(74.68)
    end

    it 'sales_taxes is 6.7' do
      expect(cart.sales_taxes).to eq(6.7)
    end
  end
end
