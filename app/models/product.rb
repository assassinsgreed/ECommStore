class Product < ActiveRecord::Base
  #Associations
  belongs_to :line_item
  
  #Validations
  validates_presence_of :name, :description, :price, :quantity_on_hand
  validates :name, :uniqueness => true
  validates :image, :uniqueness => true
  #sale price is not required.  If it is missing (null), the regular price is displayed
  #Image is not required either.  If it is present, it must be unique though
end
