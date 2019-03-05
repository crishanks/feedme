users = User.create(
    [
        {name: "Greg"},
        {name: "Ted"},
        {name: "Jill"},
        {name: "Barbara"},
        {name: "Steve"}
    ]
)

categories = Category.create(
    [
        {title: "Music"},
        {title: "Tech"},
        {title: "Food"},
        {title: "Education"},
        {title: "Woodworking"}
    ]
)

tags = Tag.create(
    [
        {name: "Top 5"},
        {name: "Really Cool"},
        {name: "To Try Later"},
        {name: "Great for Christmas"},
        {name: "So fun!"}
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
    categories: Category.all.sample(1)
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
