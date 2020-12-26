FactoryBot.define do
  factory :store do
    email { 'test1@test.com' }
    name { '店舗名' }
    representative_name { '代表　者名' }
    tel {111-111-1111}
  end
end
