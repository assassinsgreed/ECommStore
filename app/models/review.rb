class Review < ActiveRecord::Base
  #Associations
  belongs_to :product
  
  #Validations
  validates_presence_of :body
  
  #A method to ensure that the author either comes up as "Anonymous" or their author name, if given
  def attribution
    author.blank? ? 'Anonymous' : author
  end
end
