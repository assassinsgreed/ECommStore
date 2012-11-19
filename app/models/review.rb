class Review < ActiveRecord::Base
  #Associations
  belongs_to :product
  
  #Validations
  validates_presence_of :body
  validates :rating, :numericality => {:only_decimal => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}
  
  #A method to ensure that the author either comes up as "Anonymous" or their author name, if given
  def attribution
    author.blank? ? 'Anonymous' : author
  end
end
