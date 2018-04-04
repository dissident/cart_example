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

  def to_s
    result = "\n"
    result += @items.map do |i|
      "#{i[:quntity]}, #{i[:item].name}, #{'%.2f' % i[:item].cost(i[:quntity])}"
    end.join("\n")
    result += "\n"
    result += "Sales Taxes: #{'%.2f' % sales_taxes}"
    result += "\n"
    result += "Total: #{'%.2f' % total}"
    result += "\n"
    result
  end
end
