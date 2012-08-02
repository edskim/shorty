class SetDefaultForShortUrlsUserId < ActiveRecord::Migration
  def up
    change_column :short_urls, :user_id, :integer, default: 0
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
