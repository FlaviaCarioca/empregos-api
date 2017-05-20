require 'faker'

FactoryGirl.define do
  factory :candidate_skill, class: 'Skill' do
    id { Faker::Number.digit }
    name 'Ruby'
    is_required false
    created_at DateTime.now
    updated_at DateTime.now
    association :skillable, factory: :candidate
  end
end
