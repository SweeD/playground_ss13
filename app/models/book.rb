class Book < ActiveRecord::Base
  attr_accessible :name


  ##################
  ## Associations ##
  ##################
  has_and_belongs_to_many :authors
end
