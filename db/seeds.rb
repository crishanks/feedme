# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

one = Feedbag.find("101cookbooks.com").first
one_feed = Feedjira::Feed.fetch_and_parse(one)
one_done = Feed.create(url: one_feed.url, description: one_feed.description, title: one_feed.title)

# two = Feedbag.find("https://hyperallergic.com/").first
# two_feed = Feedjira::Feed.fetch_and_parse(two)
# two_done = Feed.create(url: two_feed.url, description: two_feed.description, title: two_feed.title)

one_feed.entries.each do |entry|
  Entry.create(feed: one_done, title: entry.title, url: entry.url, author: entry.author, published_datetime: entry.published, summary: entry.summary)
end
