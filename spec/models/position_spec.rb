require 'rails_helper'

describe Position, type: :model do
  it { should belong_to(:candidate) }

  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date_from) }

  it { should validate_length_of(:company_name).is_at_most(150) }
  it { should validate_length_of(:title).is_at_most(50) }
  it { should validate_length_of(:date_from).is_equal_to(7) }
  it { should validate_length_of(:date_to).is_equal_to(7) }

  it 'has a valid factory for positions' do
    expect(FactoryGirl.build(:position)).to be_valid
  end
end
