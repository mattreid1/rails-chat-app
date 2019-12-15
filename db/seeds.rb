# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a user method
def create_user(email)
	User.create!(
		email: email,
		password: "test"
	)
end

# Create 5 test users
1...5.times do |i|
	create_user("test#{i}@test.com")
end

# Post 4 messages to the global chatroom
User.find(1).messages.create(:content => "First!", :to_id => nil)
User.find(1).messages.create(:content => "Second as well!", :to_id => nil)
User.find(4).messages.create(:content => "...", :to_id => nil)
User.find(2).messages.create(:content => "🚀", :to_id => nil)