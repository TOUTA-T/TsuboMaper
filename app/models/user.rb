class User < ApplicationRecord
  # IDランダム生成用のコールバック
  # before_create :generate_displayid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :records, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_records, through: :favorites, source: :record

  # お気に入りメソッド
  def favorited_by?(record_id)
    favorites.where(record_id: record_id).exists?
  end

  private
  # ランダム生成メソッド→Create時に入れ込む
  # def generate_displayid
  #   n = 5
  #   random = format("%0#{n}d", SecureRandom.random_number(10**n))
  #   self.display_id = random
  # end

  # 検索メソッド
  # scope :search_id, -> (display_id) { where(display_id:"#{display_id}")}
end
