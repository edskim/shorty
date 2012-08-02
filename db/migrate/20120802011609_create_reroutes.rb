class CreateReroutes < ActiveRecord::Migration
  def change
    create_table :reroutes do |t|
      t.string :origin
      t.integer :short_url_id

      t.timestamps
    end
  end
end
