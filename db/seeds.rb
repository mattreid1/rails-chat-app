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

p1 = User.find(1).profile
p1.admin = true
p1.student = false
p1.save

p3 = User.find(4).profile
p3.student = false
p3.save

# Post 4 messages to the global chatroom
User.find(1).messages.create(:content => "First!", :to_id => nil)
User.find(1).messages.create(:content => "Second as well!", :to_id => nil)
User.find(4).messages.create(:content => "...", :to_id => nil)
User.find(2).messages.create(:content => "🚀", :to_id => nil)

Post.create(:title => "Labour looses", :content => "Jeremy Corbyn and John McDonnell have apologised over Labour's \"catastrophic\" defeat in Thursday's election, which saw them lose 59 seats. Mr Corbyn said he was \"sorry that we came up short\", while Mr McDonnell told the BBC he \"owns this disaster\". The leader and shadow chancellor said they would step down in the new year. The race for their replacements has already begun, with Wigan MP Lisa Nandy saying for the first time she was \"seriously thinking about\" running. Mr McDonnell said it would be up to Labour's National Executive Committee to decide the mechanics of the leadership election, but he expected it to take place in eight to 10 weeks' time. Labour suffered its worst election result since 1935 on Thursday and saw its vote share fall by eight points. The Conservatives won a Commons majority of 80 - the party's biggest election win for 30 years - sweeping aside Labour in its traditional heartlands. From https://www.bbc.co.uk/news/election-2019-50799792")
User.find(2).posts.create(:title => "Tokyo Drivers Gridlocked As 12-Legged Catbus Overturns On Highway", :content => "Finding themselves caught in a grisly tangle of wrecked vehicles and reeking with the unmistakable odor of burning fur, Tokyo commuters were stuck in traffic for as long as three hours Friday when a 12-legged catbus overturned at high speed on the KK Expressway, a main route into the city's busy downtown districts. \"It feels like this kind of horror happens every week now--just once I'd like to get on the turnpike without seeing a dozen mutilated paws flailing helplessly at the air,\" said traffic safety officer Yuki Nakamura, 34, who said the incident occurred when a tabby bus conveying two little girls, the feline driver/bus entity itself, and several unnamed spirits attempted to circumvent traffic by bouncing off nearby power lines like a trampoline, misjudged its leap badly, and tumbled onto the roadway below at high speeds. \"Thankfully, no one but the catbus was hurt, but someone has to replace those unsafe hunks of junk. Some of them have been in nonstop rotation since the late 1980s; there are few crumple zones or crash restraints inside even the most whimsical magical cat; and the aggressive behavior of cat buses in traffic is usually overlooked due to the perceived importance of, say, getting children to their dying mother's bedside or what have you. The city should really adopt the junior witch rideshare program they use in Kyoto. Commuters would gladly pay more to take a daily magical journey through the sky if it meant I could get to work on time for once.\" Tokyo officials are advising commuters to take the train out of the city in the evening instead and have assured hesitant riders that all rail lines have been fully fumigated after last year's infestation of No-Faces. https://www.theonion.com/tokyo-drivers-gridlocked-as-12-legged-catbus-overturns-1840414881")