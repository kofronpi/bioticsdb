class Strain < ApplicationRecord
  belongs_to :probiotic
  has_and_belongs_to_many :effects
  has_and_belongs_to_many :illnesses

  def presenter
    ::StrainPresenter.new(self)
  end
end
