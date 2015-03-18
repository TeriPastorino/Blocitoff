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

puts "Seed finished"
#add when get to these user stories
#puts "#{List.count} lists created"
#puts "#{Item.count} items created"