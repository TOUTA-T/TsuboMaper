class Record < ApplicationRecord
  validates :person_in_charge,  presence: true, length: { maximum: 30 }
  validates :comment, presence: true, length: { maximum: 200 }
  validates :pain_a,  presence: true
  # picture系は一旦presenceバリデーションなしで
  mount_uploader :expect_picture, ImageUploader
  mount_uploader :treatment_picture, ImageUploader
  mount_uploader :storage_picture, ImageUploader
  #できれば保存ファイルはそれぞれで分ける設定にしたい（低）
end
