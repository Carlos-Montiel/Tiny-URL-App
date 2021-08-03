class CreateStatisticsUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics_urls do |t|
      t.references :shorten_url, null: false, foreign_key: true
      t.string :accesed_ip, default: ''

      t.timestamps
    end
  end
end
