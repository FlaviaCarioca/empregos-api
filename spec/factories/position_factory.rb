require 'faker'

FactoryGirl.define do
  factory :position do
    id { Faker::Number.digit }
    company_name 'IBM'
    title 'CEO'
    date_from '01/2011'
    date_to nil
    created_at DateTime.now
    updated_at DateTime.now
    association :candidate
  end
end
