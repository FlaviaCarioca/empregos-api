require 'rails_helper'

describe AuthToken do
  describe '.encode' do
    it 'encodes a payload' do
      payload = AuthToken.encode({ user_id: 5})

      expect(payload).not_to be_nil
    end

    it 'returns nil if encoding throws an error' do
       payload = AuthToken.encode(nil)

       expect(payload).to be_nil
    end
  end

  describe '.decode' do
    it 'decodes an encoded token' do
      encoded_token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1MzI1NDEzMzl9.SbilAlIAVVbz_WXDy0u8LTgNDrQMMSp6hH-nxlREzsI'

      decoded_token = AuthToken.decode(encoded_token)

      expect(decoded_token).not_to be_nil
    end
  end
end
