class AddColorToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :feed_color, :string
  end
end
