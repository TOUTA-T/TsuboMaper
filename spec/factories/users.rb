FactoryBot.define do
  factory :user do
    email { 'test1@test.com' }
    display_id { '12345' }
    password { 'password' }
  end
end
