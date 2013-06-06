class AromaBundle < ActiveRecord::Base
  attr_accessible :aroma_id, :receipe_id

  ##################
  ## Associations ##
  ##################
  belongs_to :aroma, dependent: :destroy
  belongs_to :receipe
end
