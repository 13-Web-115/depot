class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title, :owner, :genre
  validates :title, :description, :image_url, presence:true
  validates :price, numericality: {greater_than_or_equal_to:0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
  with:   %r{\.(gif|jpg|png)$}i,
  message: 'must be a URL for GIF, JPG or PNG image.'
  }
  PRODUCT_TYPES = ['literature', 'memoir', 'art', 'photograph',
    'youth literature', 'cartoon', 'humor',
    '0-2', '3-6', '7-10', '11-14', 'picture book',
    'exercise', 'food', 'tour', 'arder', 'family',
    'coptic', 'building', 'computer', 'natural science', 'medicine',
    'foreign language', 'test', 'teaching material',
    'economy', 'manage', 'finance'
    ]
  
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :comments
  
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
