class Receipe < ActiveRecord::Base
  attr_accessible :name, :aroma_bundles_attributes

  ##################
  ## Associations ##
  ##################
  has_many :aroma_bundles
  has_many :aromas, through: :aroma_bundles

  accepts_nested_attributes_for :aroma_bundles, allow_destroy: true

  #################
  ## Validations ##
  #################
  validate :not_too_much_aromas


  ######################
  ## Instance Methods ##
  ######################
  def not_too_much_aromas
    overall_aroma = self.aroma_bundles.inject(0) do |memo, bundle|
      memo += bundle.percent if bundle.percent.is_a?(Integer) || bundle.percent.is_a?(BigDecimal)
      memo
    end

    # INFO: Same as:
    # overall_aroma = self.aroma_bundles.map do |bundle|
    #   bundle.percent
    # end

    if overall_aroma > 30
      self.errors.add(:aroma_percentage, I18n.t('activerecord.errors.receipe.aroma_percentage.too_much'))
    else
      true
    end
  end
end
