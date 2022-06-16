# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

role = Role.find_or_initialize_by(code: "admin")
role.name = "Admin"
role.save

role = Role.find_or_initialize_by(code: "user")
role.name = "User"
role.save
