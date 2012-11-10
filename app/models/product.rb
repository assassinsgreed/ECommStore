class Product < ActiveRecord::Base
  #Associations
  belongs_to :line_item
  
  #Validations
  validates_presence_of :name, :description, :price, :stock_quantity
  validates :name, :uniqueness => true
  #sale price is not required.  If it is missing (null), the regular price is displayed
end
