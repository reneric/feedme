require 'uri'
class FeedEntry < ActiveRecord::Base
  belongs_to :feed
  def self.update_from_feed(feed_url, feed_id)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    @feed_url = feed.url
    @fid = feed_id
    add_entries(feed.entries)
  end
  
  def self.update_from_feed_continuously(feed_url, delay_interval = 15.minutes)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
    loop do
      sleep delay_interval
      feed = Feedzirra::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
  end
  
  private
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id
      feeds_id = Feed.where(:name => @feed_url)

        uri = URI.parse(entry.url)
        create!(
          :feed_id     => @fid,
          :name         => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid         => entry.id
        )
      end
    end
  end
end