class Category < ActiveRecord::Base
  #Associations
  has_many :products
  
  #Validations
  validates_presence_of :name
end
