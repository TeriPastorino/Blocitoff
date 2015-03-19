require 'faker'

#create test users
10.times do
  user = User.new(
    name: Faker::Name.name,
    email:Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
    user.skip_confirmation!
    user.save!
end
users = User.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
   email: 'tpasto@comcast.net',
   password: 'password'
 )
#create my list
10.times do
  list = List.create!(
    user: users.sample,
    title: Faker::Lorem,characters(10)
    )
end

10.times do
  item = Item.create!(
    user: users.sampe,
    list: lists.sample,
    description: Faker::Lorem.sentence
    )
end

puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Item.count} items created"