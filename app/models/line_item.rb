class LineItem < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :cart_id, :product_id, :quantity
  attr_accessible :product
  belongs_to :product
  belongs_to :cart
=======
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  attr_accessible :cart_id, :product_id, :quantity
  attr_accessible :product
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  
  def total_price
    product.price * quantity
  end
end
