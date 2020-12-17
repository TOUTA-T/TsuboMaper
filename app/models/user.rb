class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :records, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_records, through: :favorites, source: :record

  # お気に入りメソッド
  def favorited_by?(record_id)
    favorites.where(record_id: record_id).exists?
  end
end
