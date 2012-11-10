class Order < ActiveRecord::Base
  #Associations
  belongs_to :customer
  has_many :line_items
  
  #Validations
end
