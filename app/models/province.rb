class Province < ActiveRecord::Base
  #Associations
  has_many :customers
  
  #Validations
end
