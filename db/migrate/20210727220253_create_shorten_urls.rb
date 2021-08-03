class CreateShortenUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shorten_urls do |t|
      t.text :long_url
      t.string :short_token, default: ''
      t.string :description, default: ''

      t.timestamps
    end
  end
end
