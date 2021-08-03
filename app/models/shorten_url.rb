class ShortenUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true, url: true
  validates :description, presence: true
end
