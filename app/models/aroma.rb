class Aroma < ActiveRecord::Base
  attr_accessible :name

  ##################
  ## Associations ##
  ##################
  has_many :aroma_bundles
  has_many :receipes, through: :aroma_bundles

  #################
  ## Validations ##
  #################
  validates_presence_of :name
end
