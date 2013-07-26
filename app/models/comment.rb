class Comment < ActiveRecord::Base
  attr_accessible :content, :poster, :product_id
  validates :content, presence:true
  belongs_to :product
end
