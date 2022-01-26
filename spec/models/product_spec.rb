require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validates all fields are filled" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: "Smite", price: 10.00, quantity: 100, category: @category)
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to eq([])
    end

    it "validates that name is not present" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: nil, price: 10.00, quantity: 100, category: @category)
      expect(@product.name).to be_nil
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates that price is not present" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: "Smite", price: nil, quantity: 100, category: @category)
      expect(@product.price).to be_nil
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "validates that quantity is not present" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: "Smite", price: 10.00, quantity: nil, category: @category)
      expect(@product.quantity).to be_nil
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates that category is not present" do
      @category = Category.create(name: "Games")
      @product = Product.create(name: "Smite", price: 10.00, quantity: 100, category: nil)
      expect(@product.category).to be_nil
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
