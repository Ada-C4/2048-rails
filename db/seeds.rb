# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(
  username: "Emily Gordon",
  email: "emgord@gmail.com",
  uid: "10102846131496465",
  provider: "facebook",
  image: "http://graph.facebook.com/10102846131496465/picture"
  )

gamesetup = Gamesetup.create(
  size: 4,
  json_cells: "[[{\"position\":{\"x\":0,\"y\":0},\"value\":2},null,null,null],[null,{\"position\":{\"x\":1,\"y\":1},\"value\":2},null,null],[{\"position\":{\"x\":2,\"y\":0},\"value\":8},null,null,null],[{\"position\":{\"x\":3,\"y\":0},\"value\":4},null,null,null]]",
  score: 20,
  over: false,
  won: false,
  keepPlaying: false)

  user.gamesetups << gamesetup
