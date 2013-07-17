class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end
    current_item
  end
  
  def total_price
<<<<<<< HEAD
    line_items.to_a.sum{ |item| item.total_price}
  end
  
=======
    line_items.to_a.sum { |item| item.total_price }
  end
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
end
