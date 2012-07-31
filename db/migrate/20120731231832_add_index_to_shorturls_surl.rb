class AddIndexToShorturlsSurl < ActiveRecord::Migration
  def change
    add_index :short_urls, :surl, unique: true
  end
end
