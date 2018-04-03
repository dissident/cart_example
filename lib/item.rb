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
    @price * quantity + tax(quantity)
  end

  def to_s(quantity)
    quantity
  end

  private

  def round_up(tax)
    (tax * 20).round / 20.0
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
