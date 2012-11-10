class Review < ActiveRecord::Base
  #Associations
  belongs_to :product
  
  #Validations
  validates_presence_of :body
end
