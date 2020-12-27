FactoryBot.define do
  factory :store do
    email { 'test1@test.com' }
    name { '店舗名' }
    representative_name { '代表　者名' }
    tel { '08011111111' }
    password { 'password' }
  end
end
