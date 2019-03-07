class Entry < ApplicationRecord
  belongs_to :feed
  has_many :entry_tags
  has_many :tags, through: :entry_tags

  def self.write_new_entries(parsed_feed)
    feed = Feed.find_by(url: parsed_feed.url)

    parsed_feed.entries.each do |entry|
      Entry.create(
        feed: feed,
        title: entry.title,
        url: entry.url,
        author: entry.author,
        published_datetime: entry.published,
        summary: entry.summary,
        content: entry.content
      )
    end
  end
end
