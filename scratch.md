Flatiron Rails App - Feedly

# Models
1. Feed
    1. relationships
        1. has many categories
        2. has many entries
    2. attributes
        1. description
        2. url
        3. title (use .title)
2. Tag
    1. relationships
        1. has many entries through entry_tag
        2. has many article_tags
    2. attributes
        1. name
3. Entry_tag
    1. relationships
        1. belongs to tag
        2. belongs to article
    2. attributes
4. Entry
    1. relationships
        1. belongs to a feed
        2. has many entry_tags
        3. has many tags through enry_tags
    2. attributes
        1. title
        2. url
        3. author
        4. entry_categories
        5. published_datetime
        6. summary
5. Category
    1. relationships
        1. has many feeds through feed_categories
        2. has many feed_categories
    2. attributes
        1. title
6. Feed Category
    1. relationships
        1. belongs to a feed
        2. belongs to a category
    2. attributes
7. User
    1. relationships
        1. has many feeds through user_feeds
        2. has many user_feeds
        <!-- 3. has many articles through feeds -->
    2. attributes
        1. name
        2. password
8. Feed_Subscriptions
    1. relationships
        1. belongs to a user
        2. belongs to a feed
    2. attributes

# Routes / Controllers
- Users Controller
- Feeds Controller
  - show
  - index
  - (new, create)
  - destroy
- Entries Controller
  - [ ] show
  - [ ] index
- Categories Controller
  - show, index, new, create, destroy, edit, update (name?)
- Tags Controller
  - show, index, new, create, destroy, edit, update (name?)

- `Feed#search`
  - is url in `Feed.all`?
    - yes,
      - show found feed with link to create
      - clicking link adds feed_subscription for user
    - no,
      - find feed w feedbag
        - found?
          - fetch / parse w feedjira
          - create Feed w `Feed.new` / `build`
          - show new/built Feed w link to create
          - clicking link adds feed_subscription for user
        - not found?
          - flash msg "Sorry no feed exists"
          - (STAGE 2) suggest other feed
  - `search` returns
    - a new Feed that hasn't been saved yet
    - OR no Feed
- `feed#new`
  - @feed = Feed.search(search term from params)
  - if Feed.search(search term from params) nil then flash message
- `feed#new.erb`
  - form_tag

# Functionality
# MVP
1. Add Content Page
  - [x] Can enter a URL and see the associated feed (MVP)
  - [x] Can subscribe to or save that feed (MVP)
  - [ ] Can view initial entries by clicking on feed and subscribe from that view (Stage 1.5)
  - [ ] Can choose feeds from a curated list / search by topic (Stage 2)
2. Entries
  - [x] View all (available) entries by clicking on a feed, sorted by descending date
  - [x] View entry contents by clicking on title from feed
  - [x] Can link back to feed from entry#show
  - [x] Can link out to original content source
  - [ ] Can view all tags assigned to entry
  - [ ] Can navigate to previous/next entries in feed
  - [ ] Can hide / delete an entry (Stage 2)
  - [ ] Can choose sort order from feed/entry#index (Stage 2)
3. Login/Logout - Welcome Page
  - [x] Can log-in to app
  - [x] Can log-out to app
  - [ ] Link to analytics/discovery
4. Show My Content - Homepage
  - [x] When I’m logged in I can see all of my saved feeds
  - [ ] Should be able to see all of the articles for each of those saved feeds (upon clicking on feed)
  - [ ] See a summary of the content and link out to the source of the content
5. Update/edit Feed Categories such as Music, Food, Tech etc.
  - [ ] Add a feed to a category
  - [ ] Remove a feed from a category
6. Tag an Entry
  - [ ] Add a tag to an entry
  - [ ] Be able to see a list of entries that share a tag
7. Navigation
  - [ ] Go "back" from an page
  - [ ] Sidebar navigation

# Tools and Gems
1. Feedbag - find rss feed urls
2. Feedjira - parse actual rss feed from rss urls

# Future Features
- Entries
  - add tags to `entry#show`
  - capture state (read / unread or something)
    - on click, change status
    - need an entry_state model (user_id, entry_id, read?, etc)
  - use templates to show entries across the app (on Tag pages, Feed pages, etc)
- Feeds
  - add Feed name aliases
  - on `feed#show`, group entries by published date
  - when searching to add content, how to be more flexible w accepted search terms?
    - google activerecord pattern matching / text matching
    - OR save feed_url to Feed
