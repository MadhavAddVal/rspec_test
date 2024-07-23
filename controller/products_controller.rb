class ProductsController
  def initialize
    @products = [
      { id: 1, name: 'Laptop', price: 1000 },
      { id: 2, name: 'Smartphone', price: 500 },
      { id: 3, name: 'Tablet', price: 750 }
    ]
  end

  def find_product(id)
    @products.find { |product| product[:id] == id }
  end

  def product_in_stock?(name)
    @products.any? { |product| product[:name] == name }
  end

  def products_count
    @products.count
  end

  def all_products
    @products
  end
end
