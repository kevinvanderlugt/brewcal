# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(name: "Example User",
                    email: "example@brewcal.com",
                    password: "foobar",
                    password_confirmation: "foobar")
dashboard = user.dashboards.first
10.times {
  brew = dashboard.brews.new( name: Faker::Name.name,
                          description: Faker::Lorem.sentence,
                          recipe_url: Faker::Internet.url,
                          og: 1.040,
                          fg: 1.012)
  brew.status=dashboard.brew_statuses.sample.to_s
  brew.save
}