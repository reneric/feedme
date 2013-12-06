class AddFeedTitleColumnToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :feed_title, :string
  end
end
