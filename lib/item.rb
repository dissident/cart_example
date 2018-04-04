# frozen_string_literal: true

# Item class contains item model logic (creation, validation, output)
class Item
  attr_reader :price, :imported, :name, :exempted

  def initialize(**params)
    validate(params)
    @price = params[:price]
    @imported = params[:imported]
    @name = params[:name]
    @exempted = params[:exempted]
  end

  def tax(quantity)
    tax = @exempted ? 0 : @price * 0.1
    tax += @price * 0.05 if @imported
    round_up(quantity * tax.round(2))
  end

  def cost(quantity)
    (@price * quantity + tax(quantity)).round(2)
  end

  def to_s(quantity)
    quantity
  end

  private

  def round_up(tax)
    last_number = (tax * 100).round % 10
    add = 0.00
    add = 0.04 if [1, 6].include? last_number
    add = 0.03 if [2, 7].include? last_number
    add = 0.02 if [3, 8].include? last_number
    add = 0.01 if [4, 9].include? last_number
    (tax + add).round(2)
  end

  def validate(params)
    errors = []
    errors.push('name') if params[:name].nil?
    errors.push('price') if params[:price].nil?
    validation_error = "Validation error, next fields can't be blank: #{errors.join(', ')}"
    raise ValidationError, validation_error unless errors.empty?
  end
end

class ValidationError < StandardError; end
