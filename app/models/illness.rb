class Illness < ApplicationRecord
  has_and_belongs_to_many :strains
end
