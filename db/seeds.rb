# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.delete_all
["りっちゃんず", "ニート", "こけ", "ぎょ", "せんたい", "ぼっちソン", "花火場"].each do |name|
  Team.create(name: name)
end