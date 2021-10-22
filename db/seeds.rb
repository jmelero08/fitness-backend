# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Workout.destroy_all

User.create(name: "Jose", username: "jmelero", password: "123")
Workout.create(name: "Chest Day", description: "Bench Press, Incline Bench", user_id: 1)
