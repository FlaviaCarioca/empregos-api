require 'rails_helper'

describe School, type: :model do
  it { should belong_to(:candidate) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date_from) }
  it { should validate_presence_of(:candidate_id) }

  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:degree).is_at_most(150) }
  it { should validate_length_of(:date_from).is_equal_to(7) }
  it { should validate_length_of(:date_to).is_equal_to(7) }

  it 'should have a valid factory for school' do
    expect(FactoryGirl.build(:school)).to be_valid
  end
end
