# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
