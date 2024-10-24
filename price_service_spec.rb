require 'date'
require 'rspec'
require_relative 'price_service'

RSpec.describe PriceService do
  subject(:call) { PriceService.new(product: product, user: user).call }

  let(:product) { { id: 1, base_price: 100 } }
  let(:user) { { id: 1, birthday_month: Date.today.next_month.month } }

  it 'calculates the total price' do
    expect(call).to eq(100.0)
  end

  context 'when product has tax' do
    let(:product) { { id: 1, base_price: 100, tax_percentage: 10 } }

    it 'applies tax amount' do
      expect(call).to eq(110.0)
    end

    it 'applies category discount' do
      product[:category] = 'food'
      expect(call).to eq(104.5)
    end

    it 'applies birthday discount' do
      user[:birthday_month] = Date.today.month
      expect(call).to eq(99)
    end

    it 'applies category and birthday discount' do
      product[:category] = 'beverages'
      user[:birthday_month] = Date.today.month
      expect(call).to eq(93.5)
    end
  end

  context 'when product has category discount' do
    it 'applies food discount' do
      product[:category] = 'food'
      expect(call).to eq(95)
    end

    it 'applies beverages discount' do
      product[:category] = 'beverages'
      expect(call).to eq(95)
    end

    it 'ignores others category' do
      product[:category] = 'others'
      expect(call).to eq(100)
    end
  end

  context 'when product has birthday discount' do
    it 'applies discount amount' do
      user[:birthday_month] = Date.today.month
      expect(call).to eq(90)
    end

    it 'ignores other birthday month' do
      user[:birthday_month] = Date.today.next_month.month
      expect(call).to eq(100)
    end
  end
end
