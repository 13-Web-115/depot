class AdminController < ApplicationController
  def index
    user = User.find_by_id(session[:user_id])
    if user.genre == "admin"
      @total_orders = Order.count
    else
      if user.genre == "shopkeeper"
        @total_orders = 0
        orders = Order.all
        orders.each do |order|
          line_items = order.line_items
          line_items.each do |item|
            if Product.find_by_id(item.product_id).owner == user.name
              @total_orders += 1
              break
            end
          end
        end
      else
        redirect_to login_url, notice: "You are not Admin or Shopkeeper. Access denied!" 
      end
    end
  end
end
