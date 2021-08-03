# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenUrl, type: :model do
  let(:valid_attributes) { { long_url: 'http://google.com', description: 'an url description' } }
  let(:new_record) { described_class.new valid_attributes }

  context 'validations' do
    it 'is invalid without a long_url' do
      new_record.long_url = ''
      expect(new_record).to_not be_valid
    end

    it 'is invalid without a description' do
      new_record.description = ''
      expect(new_record).to_not be_valid
    end

    it 'is invalid without a valid url' do
      new_record.long_url = 'a invalid url'
      expect(new_record).to_not be_valid
    end

    it 'is valid with valid attrs' do
      expect(new_record).to be_valid
    end
  end
end
