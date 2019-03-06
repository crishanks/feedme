users = User.create(
    [
        {name: "Greg"},
        {name: "Ted"},
        {name: "Jill"},
        {name: "Barbara"},
        {name: "Steve"}
    ]
)

categories = FeedCategory.create(
    [
        {title: "Music", user: User.all.sample},
        {title: "Tech", user: User.all.sample},
        {title: "Food", user: User.all.sample},
        {title: "Education", user: User.all.sample},
        {title: "Woodworking", user: User.all.sample}
    ]
)

tags = Tag.create(
    [
        {name: "Top 5", user: User.all.sample},
        {name: "Really Cool", user: User.all.sample},
        {name: "To Try Later", user: User.all.sample},
        {name: "Great for Christmas", user: User.all.sample},
        {name: "So fun!", user: User.all.sample}
    ]
)

urls = ["101cookbooks.com", "https://hyperallergic.com/"]

urls.each do |url|
  feed = Feedbag.find(url).first
  feed = Feedjira::Feed.fetch_and_parse(feed)
  new_feed = Feed.create(
    url: feed.url,
    description: feed.description,
    title: feed.title,
    feed_categories: FeedCategory.all.sample(1)
  )

  feed.entries.each do |entry|
    Entry.create(
      feed: new_feed,
      title: entry.title,
      url: entry.url,
      author: entry.author,
      published_datetime: entry.published,
      summary: entry.summary,
      tags: Tag.all.sample(1)
    )
  end
end

User.all.sample(3).each do |user|
  user.feeds = Feed.all.sample(1)
end
