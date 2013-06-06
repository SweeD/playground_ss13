class Receipe < ActiveRecord::Base
  attr_accessible :name, :aroma_bundles_attributes
  PERCENTAGE_LIMIT = 30

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
    if overall_aroma_percentage > PERCENTAGE_LIMIT
      self.errors.add(:aroma_percentage, I18n.t('activerecord.errors.receipe.aroma_percentage.too_much'))
    else
      true
    end
  end

  # Returns the overall aroma percentage
  def overall_aroma_percentage
    overall_aroma = self.aroma_bundles.inject(0) do |memo, bundle|
      memo += bundle.percent if bundle.percent.is_a?(Integer) || bundle.percent.is_a?(BigDecimal)
      memo
    end

    return overall_aroma
  end

  # return the highest aroma percentage bundle
  def highest_aroma_percentage_bundle
    # min_percentage_bundle = self.aroma_bundles.inject(nil) do |hap_bundle, bundle|
    #   hap_bundle = bundle if hap_bundle.try(:percentage).to_f < bundle.percentage.to_f
    #   hap_bundle
    # end
    @sorted_bundles ||= self.aroma_bundles.sort{|b1,b2| b1.percent.to_f <=> b2.percent.to_f }

    return @sorted_bundles.last
  end

  # set the highest aroma percentage down to the next valid value
  def fix_highest_aroma_percentage!
    to_much_in_percent = overall_aroma_percentage - PERCENTAGE_LIMIT
    highest_aroma_percentage_bundle.percent -= to_much_in_percent
  end
end
