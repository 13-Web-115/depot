class WelcomeController < ApplicationController
  def index
    @total_products = Product.count
  end
end
