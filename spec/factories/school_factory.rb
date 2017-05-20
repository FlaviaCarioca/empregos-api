require 'faker'

FactoryGirl.define do
  factory :school do
    name 'Princesa Isabel'
    degree 'High School Diploma'
    date_from '01/1988'
    date_to '12/1991'
    created_at DateTime.now
    updated_at DateTime.now
    association :candidate
  end
end
