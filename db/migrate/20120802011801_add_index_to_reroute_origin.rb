class AddIndexToRerouteOrigin < ActiveRecord::Migration
  def change
    add_index :reroutes, :origin
  end
end
