class AromaBundle < ActiveRecord::Base
  attr_accessible :aroma_id, :receipe_id, :percent

  ##################
  ## Associations ##
  ##################
  belongs_to :aroma, dependent: :destroy
  belongs_to :receipe

  #################
  ## Validations ##
  #################
  validates_numericality_of :percent
  validates_inclusion_of :percent, in: 1..100
  validates_presence_of :percent
end
