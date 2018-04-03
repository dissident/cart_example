# frozen_string_literal: true

# Cart class for output rendering and total counting
class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item, quantity)
    @items.push({
      item: item,
      quntity: quantity
    })
    @items
  end

  def total
    @items.map { |i| i[:item].cost(i[:quntity]) }.reduce(0, :+).round(2)
  end

  def sales_taxes
    @items.map { |i| i[:item].tax(i[:quntity]) }.reduce(0, :+).round(2)
  end
end
