class FeedEntry < ActiveRecord::Base
  def self.update_from_feed(feed_url)  
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
    feed.entries.each do |entry|  
      unless exists? :guid => entry.id  
        create!(  
          :name         => entry.title,  
          :summary      => entry.summary,  
          :url          => entry.url,  
          :author           => entry.author,
          :published_at => entry.published,  
          :guid         => entry.id  
        )  
      end  
    end  
  end  
  belongs_to :feeds
end
class Feed < ActiveRecord::Base
  has_many :feed_entries 
end

feed_entry = FeedEntry.first
