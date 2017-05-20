require 'rails_helper'

describe Skill, type: :model do
  it { should belong_to(:skillable) }

  it { should validate_presence_of(:name) }
  it { should validate_inclusion_of(:is_required).in_array([true, false]) }
  it { should validate_presence_of(:skillable_id) }
  it { should validate_presence_of(:skillable_type) }

  it { should validate_length_of(:name).is_at_most(20) }
  it { should validate_length_of(:skillable_type).is_at_most(10) }

  describe 'uniqueness' do
    # This matcher works a bit differently than other matchers.
    # It will create an instance of your model if one doesn't already exist.
    # Sometimes this step fails, especially if you have database-level restrictions on any
    # attributes other than the one which is unique. In this case, the solution is to populate these
    # attributes with before you call validate_uniqueness_of.
    subject { FactoryGirl.build(:candidate_skill) }
    it { should validate_uniqueness_of(:skillable_id).scoped_to(:skillable_type) }
  end

  it 'has a valida factory for candidate skills' do
    expect(FactoryGirl.build(:candidate_skill)).to be_valid
  end
end
