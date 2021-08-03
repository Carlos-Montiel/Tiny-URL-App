class ShortenUrl < ApplicationRecord
  validates :long_url,  presence: true, uniqueness: true, url: true
  validates :description, :short_token, presence: true

  before_validation :set_short_token

  private
  def set_short_token
    return unless new_record?
    
    self.short_token = generate_token
  end

  def generate_token
    token = SecureRandom.uuid[0..5]
    ShortenUrl.find_by(short_token: token) ? generate_token : token
  end
end
