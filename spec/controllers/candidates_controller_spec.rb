require 'rails_helper'

describe API::V1::CandidatesController, type: :controller do
  describe 'PUT #update' do
    before(:each) do
       @candidate = {
          address: Faker::Address.street_address,
          city:  Faker::Address.city,
          state: Faker::Address.state_abbr,
          zip: Faker::Address.zip,
          title: 'Software Engineer',
          description: Faker::Lorem.paragraph(2),
          minimum_salary: Faker::Number.number(6),
          linkedin: Faker::Internet.url('linkedin.com', '/someone.html'),
          github: Faker::Internet.url('github.com', '/someone.html'),
          is_active: true,
          can_relocate: false,
          can_remote: true,
          is_visa_needed: false
        }
    end

    it 'updates a candidate' do
      current_user = FactoryGirl.create(:user_candidate)
      controller.instance_variable_set(:@current_user, current_user)

      put :update, params: { candidate: @candidate }

      expect(response).to be_success
    end

    it 'returns error if candidate cannot be updated' do
      current_user = double('current_user')
      profile = double('profile')
      controller.instance_variable_set(:@current_user, current_user)
      allow(current_user).to receive(:profile).and_return(profile)
      allow(profile).to receive(:update_attributes).and_raise('error')

      put :update, params: { candidate: @candidate }

      expect(response).not_to be_success
      expect(response.status).to eq 500
    end
  end
end
