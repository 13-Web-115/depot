class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
<<<<<<< HEAD
	@cart = current_cart
=======
    @cart = current_cart
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end
end
