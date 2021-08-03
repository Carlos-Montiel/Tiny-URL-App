require 'rails_helper'

RSpec.describe StatisticsUrl, type: :model do
  context 'relations' do
    it 'belongs to shorten url' do
      statistics_url = described_class.reflect_on_association(:shorten_url)
      expect(statistics_url.macro).to eq(:belongs_to)
    end
  end
end
