class Receipe < ActiveRecord::Base
  attr_accessible :name, :aromas_attributes

  ##################
  ## Associations ##
  ##################
  has_many :aroma_bundles
  has_many :aromas, through: :aroma_bundles

  accepts_nested_attributes_for :aromas, allow_destroy: true
end
