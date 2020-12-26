FactoryBot.define do
  factory :record do
    person_in_charge { '施術者A' }
    pain_a { '首' }
    association :user
    association :store

    after(:build) do |record|
      label = create(:label)
      record.labellings << build(:labelling, record: record, label: label)
    end
  end
end
