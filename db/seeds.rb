# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create!(name: "Thomas Edison", email: "eth3@memphis.edu", password: "123456", department: "Computer Science", 
    major:"Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00" )
item_1 = user_1.items.build(description: '11111', price: 5, title:'Apple watch', condition: 'good',category_id: 2)
item_1.update(photo_file_name: 'bopit.jpg')



user_2 = User.create!(name: "Isaac Newton", email: "nis5@memphis.edu", password: "654321", department: "Computer Science", 
    major:"Computer Science" ,confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00")
set_1 = user_1.deals.build(review: 'Good seller!')

item_2 = user_2.items.build(description: 'not blank', price: 67, title:'ipad2', condition: 'used',category_id:1)
item_2.update(photo_file_name: 'bopit.jpg')
item_2.settlement = set_1
cat_1 = Category.create!(description:"Electronic")
cat_1.products << item_1
cat_1.products << item_2
user_1.save!
user_2.save!
cat_1.save!


user_3 = User.create!(name: "Admin Istrator", email: "admin@memphis.edu", major: "Computer Science", 
    department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
    password: "123456" )
item_3 = user_3.items.build(description: "This is my item. Please buy it.", price: 3.25, title: "My Awesome Item", condition: 'used',category_id: 1)
item_3.update(photo_file_name: 'bopit.jpg')
item_4 = user_3.items.build(description: "This weird guy with a terrible beard keeps bothering me. I will pay someone to get him to leave.", price: -10, title: "Weird Guy With Beard", condition: 'used', category_id: 2)
item_4.update(photo_file_name: 'beard.jpg')
cat_1.products << item_3
cat_1.products << item_4
user_3.save!

user_4 = User.create!(name: "Andrew", email: "andrew@memphis.edu", major: "Computer Science", 
    department: "Computer Science", confirmed_at: "Thu, 04 Apr 2019 04:55:06 UTC +00:00 ",
    confirmation_sent_at: "Thu, 04 Apr 2019 04:54:31 UTC +00:00",
    password: "123456" )
item_5 = user_4.items.build(description: "Textbook by C.S. Lewis", price: 12, title: "The Pilgrim's Guide", condition: 'used', category_id: 3)
cat_1.products << item_5
user_4.save!
