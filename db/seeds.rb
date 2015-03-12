# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(firstname: 'User', lastname: 'man', email: 'user@example.com', password: 'password')
User.create(firstname: 'Aaa', lastname: 'Bbb', email: 'aaabbb@example.com', password: 'password')
User.create(firstname: 'Bob', lastname: 'Smith', email: 'bobsmith@example.com', password: 'password')
User.create(firstname: 'Jane', lastname: 'Doe', email: 'janedoe@example.com', password: 'password')

Organization.create(orgname: 'Org', orgabout: 'An organization for organizations', email: 'org@example.com', password: 'password')
Organization.create(orgname: 'Happy Makers', orgabout: 'making people happy', email: 'happy@example.com', password: 'password')
Organization.create(orgname: 'Animal Shelter', orgabout: 'Rescuing stray animals', email: 'animals@example.com', password: 'password')
Organization.create(orgname: 'L0vely', orgabout: 'Nerb dating app', email: 'l0ve@example.com', password: 'password')

