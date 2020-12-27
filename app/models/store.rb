class Store < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :records, dependent: :destroy

  # 電話番号バリデーション
  VALID_PHONE_NUMBER_REGEX = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/

  validates :name,  presence: true
  validates :representative_name,  presence: true, length: { maximum: 30 }
  validates :tel,  presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
end
