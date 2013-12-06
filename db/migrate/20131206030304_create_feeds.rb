class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :base_url
      t.string :feed_url
      t.datetime :last_modified

      t.timestamps
    end
  end
end
