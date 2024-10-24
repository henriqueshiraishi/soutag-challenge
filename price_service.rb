class PriceService
  attr_reader :product, :user

  def initialize(product:, user:)
    @product = product
    @user = user
  end

  # Método de chamada para recuperar preço final do produto
  def call
    final_price
  end

  private

    # Captura preço base do produto
    def base_price
      product[:base_price]
    end

    # Calcula preço final do produto
    def final_price
      base_price + tax_amount
    end

    # Calcula o valor do imposto sobre o preço base do produto
    def tax_amount
      base_price * (product[:tax_percentage] / 100.0)
    end
end
