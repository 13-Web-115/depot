class ApplicationController < ActionController::Base
<<<<<<< HEAD
=======
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  protect_from_forgery
  
  private
  
<<<<<<< HEAD
	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
=======
    def current_cart
      Cart.find(session[:cart_id])
     rescue ActiveRecord::RecordNotFound
       cart = Cart.create
       session[:cart_id] = cart.id
       cart
    end
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
end
