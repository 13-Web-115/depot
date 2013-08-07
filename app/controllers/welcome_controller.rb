class WelcomeController < ApplicationController
  def index
    @total_products = Product.count
    @cart = current_cart
  end
end
