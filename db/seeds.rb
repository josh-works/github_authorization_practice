# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
josh = User.create!(
  email: "joshthompson@heyy.com", 
  password: "password",
  provider: "github", 
  uid: "5198260", 
  name: "Josh Thompson", 
  image: "https://avatars.githubusercontent.com/u/5198260?v=4", 
  nickname: "josh-works")
kristi = User.create!(
  email: "kristi@example.com",
  password: "password",
  provider: "github",
  uid: "123", 
  name: "Kristi Thompson",
  nickname: "kristi-works"
)

josh.brag_entries.create(body: "made $5k")
josh.brag_entries.create(body: "biked around Golden")
josh.brag_entries.create(body: "started brag doc app")

kristi.brag_entries.create(body: "finished basement window project")
kristi.brag_entries.create(body: "training new coworker on own job")