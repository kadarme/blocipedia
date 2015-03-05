require 'faker'

# Create Users
5.times do
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
  users = User.all
  
# Create Wikis
50.times do 
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user: users.sample
    )
end
  wikis = Wiki.all
  
# Create an admin user
admin = User.new(
  name:      'Admin User',
  email:     'admin@example.com',
  password:  'helloworld',
  role:      'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a premium user
premium = User.new(
  name:      'Premium User',
  email:     'premium@example.com',
  password:  'helloworld',
  role:      'premium'
  )
premium.skip_confirmation!
premium.save!

# Create member user
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
  )
member.skip_confirmation!
member.save!

puts 'Seed Finished'
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."