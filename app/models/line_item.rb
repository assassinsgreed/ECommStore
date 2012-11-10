class LineItem < ActiveRecord::Base
  #Associations
  has_one :product
  belongs_to :order
  
  #Validations
  validates_presence_of :quantity, :price, :product_id, :order_id
end
