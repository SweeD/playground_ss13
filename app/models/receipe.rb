class Receipe < ActiveRecord::Base
  attr_accessible :name, :aroma_bundles_attributes

  ##################
  ## Associations ##
  ##################
  has_many :aroma_bundles
  has_many :aromas, through: :aroma_bundles

  accepts_nested_attributes_for :aroma_bundles, allow_destroy: true
end
