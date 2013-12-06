class CreateFeedEntriesTable < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.belongs_to :feed, index: true
      t.string :name
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid

      t.timestamps
    end
    #add_index :feed_entries, :feed_id
  end
end

