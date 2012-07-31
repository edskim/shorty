class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :surl
      t.string :lurl

      t.timestamps
    end
  end
end
