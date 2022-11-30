# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
User.delete_all

USERS_COUNT = 10
POSTS_COUNT = 100

(1..USERS_COUNT).each do |u|
    User.create!(email: "user#{u}@example.com", password: '111111')
end

(1..POSTS_COUNT).each do |p|
    Post.create!(name: "Post#{p}", title: "Post title #{p}", user: User.all.sample)
end
