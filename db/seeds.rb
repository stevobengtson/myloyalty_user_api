# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by(email: 'admin@myloyalty.ca') do |user|
  user.name = 'Admin'
  user.password = 'test1234Test'
  user.password_confirmation = 'test1234Test'
end
