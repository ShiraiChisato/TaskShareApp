# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
50.times do |n|
  User.create(name:"test#{n}", email:"mail#{n}@example.com", password:"test#{n}", password_confirmation:"test#{n}")
end
5.times do |n|
  Project.create(name:"にゃん#{n}", topic1:"try", topic2:"do")
  User.all.each do |usr|
    Associate.create(user: usr, project: Project.last)
  end
  Associate.where(user: User.first, project: Project.last).update(host: true)
end