class Product < ActiveRecord::Base

  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url,  allow_blank: true, format: {
    with:   %r{\.(gif|jpg|png)$}i,    # “\.”转义字符， .指纯粹的dot，而不是代表所有字符
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
  
	#ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end  
end
