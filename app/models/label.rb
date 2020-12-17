class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :records, through: :labellings
end
