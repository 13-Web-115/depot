class Comment < ActiveRecord::Base
  attr_accessible :content, :poster, :product_id
  belongs_to :product
end
