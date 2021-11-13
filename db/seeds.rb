# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
5.times do
    Category.create!(
    name: Faker::FunnyName.name,
    visibility: rand(0..1)
    )
end
category = Category.all
5.times do
    Type.create!(
    name: Faker::Games::LeagueOfLegends.champion
    )
end
type = Type.all
20.times do
    Bookmark.create!(
    name: Faker::Kpop.girl_groups,
    url: Faker::Internet.url(host: 'faker'),
    category: category.sample,
    type: type.sample
    )
end

