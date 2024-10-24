require 'date'

class PriceService
  attr_reader :product, :user

  def initialize(product:, user:)
    @product = product
    @user = user
  end

  # Método de chamada para recuperar preço final do produto com desconto
  def call
    final_price - discount_amount
  end

  private

    # Captura preço base do produto
    def base_price
      product[:base_price].to_f
    end

    # Calcula preço final do produto
    def final_price
      base_price + tax_amount
    end

    # Calcula o valor do imposto sobre o preço base
    def tax_amount
      base_price * (product[:tax_percentage].to_f / 100.0)
    end

    # Calcula o total de desconto do produto
    def discount_amount
      birthday_discount + category_discount
    end

    # Calcula o valor do desconto de aniversário sobre o preço final
    def birthday_discount
      discount_percentage = 10

      if user[:birthday_month] == Date.today.month
        final_price * (discount_percentage.to_f / 100)
      else
        0
      end
    end

    # Calcula o valor do desconto de categoria sobre o preço final
    def category_discount
      discount_percentage = 5

      if %w( food beverages ).include?(product[:category])
        final_price * (discount_percentage.to_f / 100)
      else
        0
      end
    end
end
