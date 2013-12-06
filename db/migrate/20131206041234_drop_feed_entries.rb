class DropFeedEntries < ActiveRecord::Migration
  def change
  	drop_table :feed_entries
  end
end
