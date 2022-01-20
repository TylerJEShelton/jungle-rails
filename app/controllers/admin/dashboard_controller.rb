class Admin::DashboardController < ApplicationController
  def show
    @total_categories = Category.count
    puts @total_categories
    @total_products = Product.count
    puts @total_products
  end
end
