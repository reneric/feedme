class AddAuthorColumnToFeedEntries < ActiveRecord::Migration
  def change
    add_column :feed_entries, :author, :string
  end
end
