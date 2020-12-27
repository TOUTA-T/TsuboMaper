FactoryBot.define do
  factory :store do
    email { 'test1@test.com' }
    name { '店舗名' }
    representative_name { '代表　者名' }
    tel { "0#{rand(7..9)}0#{rand(10_000_000..99_999_999)}" }
  end
end
