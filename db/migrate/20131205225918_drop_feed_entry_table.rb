class DropFeedEntryTable < ActiveRecord::Migration
    def up
    drop_table :feed_entries
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
