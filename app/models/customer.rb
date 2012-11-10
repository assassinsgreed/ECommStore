class Customer < ActiveRecord::Base
  #Associations
  has_many :orders
  belongs_to :province
  
  #Validations
  #All the below are added because they're at least needed for shipping
  validates :first_name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :country, :presence => true
  validates :postal_code, :presence => true
  validates :province_id, :presence => true
  validates :email, :presence => true
end
