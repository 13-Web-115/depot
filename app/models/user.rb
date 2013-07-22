class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :password, :password_confirmation, :genre
  validates :name, presence:true, uniqueness:true
  USER_TYPES = ["ordinary", "shopkeeper", "admin"]
  has_secure_password
  
  after_destroy :ensure_an_admin_remains
  
  has_many :products
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
