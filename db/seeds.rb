# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clubs = Club.create([{name: "The Comedy Cellar", address: "117 Macdougal St #1267, New York, NY 10012"},
                     {name: "Dangerfields", address: "1118 1st Avenue, E 61st St, New York, NY 10065"},
                     {name: "Hollywood Improv (The Lab)", address: "8162 Melrose Avenue Hollywood, CA 90046"},
                     {name: "Punchline", address: "444 Battery Street San Francisco, CA 94111"},
                     {name: "Comedy Works Denver", address: "1226 15th St, Denver, CO 80202"},
                     {name: "The Comedy Store", address: "8433 Sunset Boulevard, Los Angeles, CA 90069"},
                     {name: "Carolines", address: "1626 Broadway, New York, NY 10019"},
                     {name: "Zanies", address: "2025 8th Avenue, South Nashiville, TN 37204"},
                     {name: "Acme Comedy Co.", address: "708 North 1st Street, Minneapolis, MN 55401"},
                     {name: "Cap City Comedy", address: "8120 Research Blvd Suite 100, Austin, TX 78758"},])

User.create(email: "user1@email.com", password: "password")
User.create(email: "user2@email.com", password: "password")
User.create(email: "user3@email.com", password: "password")
User.all.each do |user|
  10.times do
    user.jokes.create(topic: Faker::Hipster.word, body: Faker::Hipster.sentence)
  end
  10.times do
    user.shows.create(date: Faker::Date.forward(days: 23), name: Faker::Space.galaxy, club_id: Club.all.sample.id)
  end
end
