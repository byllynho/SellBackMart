# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_1 = User.create!(name: "Admin Istrator", email: "admin@memphis.edu", major: "Computer Science", 
    department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
    password: "123456" )
item_1 = user_1.items.build(description: "This is my item. Please buy it.", price: 3.25, title: "My Awesome Item", category_id: 1)
item_1.update(photo_file_name: 'bopit.jpg')
item_2 = user_1.items.build(description: "This weird guy with a terrible beard keeps bothering me. I will pay someone to get him to leave.", price: -10, title: "Weird Guy With Beard", category_id: 1)
item_2.update(photo_file_name: 'beard.jpg')
user_1.save!

user_2 = User.create!(name: "Andrew", email: "andrew@memphis.edu", major: "Computer Science", 
    department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
    password: "123456" )
user_2.save!
