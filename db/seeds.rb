# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Alex', email: 'alex.krewson@gmail.com', password: 'aaaaaa')
User.create(name: 'Mr H', email: 'humblebragger@humblebrag.com', password: 'humblebaby')

Friendship.create(user_id: "1", friend_id: "2")
