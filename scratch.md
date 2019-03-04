Flatiron Rails App - Feedly

# Models
1. Feed 
    1. relationships
        1. has many categories
        2. has many entries
    2. attributes
        1. description
        2. url
        3. title? (We need to research where to get the title. Maybe from HTML header?)
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
        1. has many feeds through category_feed
        2. has many category_feeds
    2. attributes
        1. title
6. Category_Feed
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
8. User_Feed
    1. relationships
        1. belongs to a user
        2. belongs to a feed
    2. attributes

# Functionality
# MVP
1. Add Content Page
    1. Can enter a URL and see a list of content entries from a feed
    2. Can subscribe to or save that feed
    3. Can choose feeds from a curated list (This is stage 2 functionality)
2. Login/Logout - Welcome Page
    1. Link to analytics/discovery
3. Show My Content - Homepage
    1. When I’m logged in I can see all of my saved feeds
    2. Should be able to see all of the articles for each of those saved feeds (upon clicking on feed)
    3. See a summary of the content and link out to the source of the content
4. Update/edit Feed Categories such as Music, Food, Tech etc.
    1. Add a feed to a category
    2. Remove a feed from a category
5. Tag an article
    1. Add a tag to an article
    2. Be able to see a list of articles that share a tag

# Tools and Gems
1. Feedbag - find rss feed urls
2. Feedjira - parse actual rss feed from rss urls
