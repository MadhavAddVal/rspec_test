require 'rspec'
require_relative '../../controller/products_controller'

RSpec.describe ProductsController do
  before(:each) do
    @controller = ProductsController.new
  end

  describe '#find_product' do
    it 'returns the correct product for a given ID' do
      expect(@controller.find_product(2)).to eq({ id: 2, name: 'Smartphone', price: 500 })
    end

    it 'returns nil for a non-existent product ID' do
      expect(@controller.find_product(999)).to be_nil
    end
  end

  describe '#product_in_stock?' do
    it 'returns true if the product is in stock' do
      expect(@controller.product_in_stock?('Laptop')).to be true
    end

    it 'returns false if the product is not in stock' do
      expect(@controller.product_in_stock?('Camera')).to be false
    end
  end

  describe '#products_count' do
    it 'returns the total count of products' do
      expect(@controller.products_count).to eq(3)
    end
  end

  describe '#all_products' do
    it 'includes the product with name "Tablet"' do
      expect(@controller.all_products).to include(hash_including(name: 'Tablet'))
    end

    it 'does not include a product with name "Camera"' do
      expect(@controller.all_products).not_to include(hash_including(name: 'Camera'))
    end
  end
end
