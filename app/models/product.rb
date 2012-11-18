class Product < ActiveRecord::Base
  #Associations
  belongs_to :line_item
  has_many :reviews
  
  #Validations
  validates_presence_of :name, :description, :price, :quantity_on_hand
  validates :name, :uniqueness => true
  #sale price is not required.  If it is missing (null), the regular price is displayed 
end
